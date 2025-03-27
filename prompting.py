import os, argparse, random
from tqdm import tqdm

import torch
from transformers import GemmaTokenizerFast, GemmaForCausalLM
from transformers import GemmaTokenizer, AutoModelForCausalLM
from transformers import BitsAndBytesConfig

from load_data import load_lines

from utils import set_random_seeds, compute_metrics, save_queries_and_records, compute_records
from prompting_utils import read_schema, extract_sql_query, save_logs, process_nl, get_key_words
from load_data import load_prompting_data

DEVICE = torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu') # you can add mps

MAX_NEW_TOKENS = 1500

SHOT_X = load_lines('prompts/train_nl.txt')
SHOT_Y = load_lines('prompts/train_sql.txt')

schema = read_schema("data/schema.txt")
train_nl = None
train_nl_list = None
train_nl_keys = None
train_sql = None

def get_args():
    '''
    Arguments for prompting. You may choose to change or extend these as you see fit.
    '''
    parser = argparse.ArgumentParser(
        description='Text-to-SQL experiments with prompting.')

    parser.add_argument('-s', '--shot', type=int, default=0,
                        help='Number of examples for k-shot learning (0 for zero-shot)')
    parser.add_argument('-p', '--ptype', type=int, default=0,
                        help='Prompt type')
    parser.add_argument('-m', '--model', type=str, default='gemma',
                        help='Model to use for prompting: gemma (gemma-1.1-2b-it) or codegemma (codegemma-7b-it)')
    parser.add_argument('-q', '--quantization', action='store_true',
                        help='Use a quantized version of the model (e.g. 4bits)')

    parser.add_argument('--seed', type=int, default=42,
                        help='Random seed to help reproducibility')
    parser.add_argument('--experiment_name', type=str, default='experiment',
                        help="How should we name this experiment?")
    args = parser.parse_args()
    return args

def set_diff(s1, s2):
    cost = 0
    for x in s1:
        if x not in s2:
            cost += 1
    for x in s2:
        if x not in s1:
            cost += 1
    return cost

def get_matching_ex(key_words, k):

    costs = [set_diff(key_words, nl) for nl in train_nl_keys]
    
    min_cost = 0
    idx = []
    i = 0
    while len(idx) < k:
        if costs[i] == min_cost and i not in idx:
            idx.append(i)

        i += 1
        i %= len(costs)
        if i == 0:
            min_cost += 1
            #print("Up cost")
    
    #print(idx)
    return idx


def rotate(l):
    return l[-1:] + l[:-1]

def create_prompt(sentence, k):
    '''
    Function for creating a prompt for zero or few-shot prompting.

    Add/modify the arguments as needed.

    Inputs:
        * sentence (str): A text string
        * k (int): Number of examples in k-shot prompting
    '''

    prompt = 'You are a very powerful text-to-sql model. Given the following SQL tables, \
        create an SQL query for a user request. \n\n'
    prompt += schema

    key_words = get_key_words(sentence)

    cur_idx = []
    k = min(k, 10)
    if k > 0:
        #prompt += '\n Construct your SQL query using the exact syntax from the examples provided. \n\n'
        cur_idx = get_matching_ex(key_words, k)
    
    for i in cur_idx:
        prompt += '\n[Instruction]: ' + train_nl[i] + '\n'
        prompt += '[Answer]: ' + train_sql[i] + '\n'
        
    if len(cur_idx) > 0:
        prompt += 'Base your answer on these examples. \n'

    prompt += 'Create an SQL Query for the following natural language instruction. \
    Do not use outside information. \
    Capitalize strings in quotations.\
    Only return the query and nothing else.  \
    \n'
    

    prompt += '[Instruction]: ' + sentence + '\n'
    prompt += '[Answer]: '

    #print(prompt)

    return prompt



def exp_kshot(tokenizer, model, inputs, k):
    '''
    k-shot prompting experiments using the provided model and tokenizer. 
    This function generates SQL queries from text prompts and evaluates their accuracy.

    Add/modify the arguments and code as needed.

    Inputs:
        * tokenizer
        * model
        * inputs (List[str]): A list of text strings
        * k (int): Number of examples in k-shot prompting
    '''
    raw_outputs = []
    extracted_queries = []

    for i, sentence in tqdm(enumerate(inputs)):
        prompt = create_prompt(sentence, k) # Looking at the prompt may also help

        input_ids = tokenizer(prompt, return_tensors="pt").to(DEVICE)
        outputs = model.generate(**input_ids, max_new_tokens=MAX_NEW_TOKENS) # You should set MAX_NEW_TOKENS
        response = tokenizer.decode(outputs[0], skip_special_tokens=True) # How does the response look like? You may need to parse it
        raw_outputs.append(response)

        # Extract the SQL query
        extracted_query = extract_sql_query(response)
        extracted_queries.append(extracted_query)
    return raw_outputs, extracted_queries


def eval_outputs(eval_x, eval_y, gt_sql_pth, model_sql_path, gt_record_path, model_record_path):
    '''
    Evaluate the outputs of the model by computing the metrics.

    Add/modify the arguments and code as needed.
    '''
    sql_em, record_em, record_f1, model_error_msgs = compute_metrics(gt_sql_pth, model_sql_path, gt_record_path, model_record_path)

    errors = [1 if "error" in msg or "Error" in msg else 0 for msg in model_error_msgs]
    error_rate = sum(errors) / len(errors)

    return sql_em, record_em, record_f1, model_error_msgs, error_rate


def initialize_model_and_tokenizer(model_name, to_quantize=False):
    '''
    Args:
        * model_name (str): Model name ("gemma" or "codegemma").
        * to_quantize (bool): Use a quantized version of the model (e.g. 4bits)
    
    To access to the model on HuggingFace, you need to log in and review the 
    conditions and access the model's content.
    '''
    if model_name == "gemma":
        model_id = "google/gemma-1.1-2b-it"
        tokenizer = GemmaTokenizerFast.from_pretrained(model_id)
        # Native weights exported in bfloat16 precision, but you can use a different precision if needed
        if to_quantize:
            nf4_config = BitsAndBytesConfig(load_in_4bit=True, bnb_4bit_quant_type="nf4")
            model = GemmaForCausalLM.from_pretrained(
                model_id,
                torch_dtype=torch.bfloat16,
                quantization_config=nf4_config 
            )

        else:
            model = GemmaForCausalLM.from_pretrained(
                model_id,
                torch_dtype=torch.bfloat16,
            ).to(DEVICE)
    elif model_name == "codegemma":
        model_id = "google/codegemma-7b-it"
        tokenizer = GemmaTokenizer.from_pretrained(model_id)
        if to_quantize:
            nf4_config = BitsAndBytesConfig(
                load_in_4bit=True,
                bnb_4bit_quant_type="nf4", # 4-bit quantization
            )
            model = AutoModelForCausalLM.from_pretrained(model_id,
                                                        torch_dtype=torch.bfloat16,
                                                        config=nf4_config).to(DEVICE)
        else:
            model = AutoModelForCausalLM.from_pretrained(model_id,
                                                        torch_dtype=torch.bfloat16).to(DEVICE)
    return tokenizer, model


def main():
    '''
    Note: this code serves as a basic template for the prompting task. You can but 
    are not required to use this pipeline.
    You can design your own pipeline, and you can also modify the code below.
    '''

    args = get_args()
    shot = args.shot
    ptype = args.ptype
    model_name = args.model
    to_quantize = args.quantization
    experiment_name = args.experiment_name

    set_random_seeds(args.seed)

    data_folder = 'data'
    train_x, train_y, dev_x, dev_y, test_x = load_prompting_data(data_folder)

    global train_nl, train_nl_list, train_sql, train_nl_keys

    train_nl = process_nl(train_x)
    train_nl_list = [line.split() for line in train_nl]
    train_nl_keys = [get_key_words(line) for line in train_nl]
    train_sql = train_y

    with open('data/prompt_t_x.nl', "w") as f:
        for line in train_nl:
            print(line, file=f)

    test_nl = process_nl(test_x)


    # Model and tokenizer
    tokenizer, model = initialize_model_and_tokenizer(model_name, to_quantize)

    for eval_split in ["test"]:
        eval_x, eval_y = (dev_x, dev_y) if eval_split == "dev" else (test_nl, None)

        raw_outputs, extracted_queries = exp_kshot(tokenizer, model, eval_x, shot)

        # You can add any post-processing if needed
        # You can compute the records with `compute_records``

        gt_query_records = f"records/{eval_split}_gt_records.pkl"
        gt_sql_pth = os.path.join(f'data/{eval_split}.sql')
        model_sql_path = os.path.join(f'results/gemma_{experiment_name}_{eval_split}.sql')
        model_record_path = os.path.join(f'records/gemma_{experiment_name}_{eval_split}.pkl')

        save_queries_and_records(extracted_queries, model_sql_path, model_record_path)
        
        if eval_split == "test":
            continue

        
        sql_em, record_em, record_f1, model_error_msgs, error_rate = eval_outputs(
            eval_x, eval_y,
            gt_sql_pth=gt_sql_pth,
            model_sql_path=model_sql_path,
            gt_record_path=gt_query_records,
            model_record_path=model_record_path
        )
        
        print(f"{eval_split} set results: ")
        print(f"Record F1: {record_f1}, Record EM: {record_em}, SQL EM: {sql_em}")
        print(f"{eval_split} set results: {error_rate*100:.2f}% of the generated outputs led to SQL errors")

        # Save results
        # You can for instance use the `save_queries_and_records` function

        # Save logs, if needed
        log_path = os.path.join("logs", experiment_name + ".txt") # to specify
        save_logs(log_path, sql_em, record_em, record_f1, model_error_msgs)


if __name__ == "__main__":
    main()
