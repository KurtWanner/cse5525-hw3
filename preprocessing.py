import os, random, re, string
from collections import Counter
from tqdm import tqdm
import pickle

from torch.utils.data import Dataset, DataLoader
from torch.nn.utils.rnn import pad_sequence
from tokenizers import AddedToken


import nltk
from transformers import T5TokenizerFast, AutoTokenizer, AutoModelForCausalLM
import torch
from t5_utils import Tokens
from utils import *

tokenizer = Tokens.Tokenizer
SOS = "<extra_id_0>"
EOS = "<extra_id_1>"

ex1 = "<extra_id_10>mke "
ex2 = "what flights are available from pittsburgh to baltimore on july twenty fifth 1991"

def load_stop_words():
    with open('data/stop_words.txt', "r+") as file:
         stop = file.readlines()
         
    return [line.strip() for line in stop]

def load_stop_phrases():
    with open('data/stop_phrases.txt', "r+") as file:
         stop = file.readlines()
         
    return [line.replace('\n', '') for line in stop]

def load_replacements():
    with open('data/replacements_multi.txt', "r+") as file:
        multi = dict(tuple(x.replace('\n', '') for x in line.split('\t'))
            for line in file.readlines())
    with open('data/replacements_single.txt', "r+") as file:
        single = dict(tuple(x.replace('\n', '') for x in line.split('\t'))
            for line in file.readlines())
    return (single, multi)

def load_train():
    with open('data/train.nl', "r+") as file:
         nlData = file.readlines()
         nlData = [line.strip() for line in nlData]

             
    with open('data/train.sql', "r+") as file:
         sqlData = file.readlines()
         sqlData = [line.strip() for line in sqlData]

    return (nlData, sqlData)

def print_train(nl):
    with open('data/train_post.nl', "w+") as file:
        for ex in nl:
            print(ex, file=file)
    

def load_dev():
    with open('data/dev.nl', "r+") as file:
         nlData = file.readlines()

             
    with open('data/dev.sql', "r+") as file:
         sqlData = file.readlines()

    return (nlData, sqlData)

def remove_words(nl, stop_words):
    return [" ".join([w for w in s.split() if w not in stop_words]) for s in nl]

def get_unique_set(data):
    s = set()
    for ex in data:
        for word in ex:
            if word not in s:
                s.add(word)
    return s

def print_statistics(data):
    print(f"Number of Training Examples: {len(data)}")

    len_counts = [len(ex) for ex in data]

    print(f"Mean Length: {sum(len_counts) / len(len_counts)}")

    vocab = get_unique_set(data)

    print(f"Vocab Size: {len(vocab)}")


def test_b2():
    # pip install accelerate

    tokenizer = AutoTokenizer.from_pretrained("google/gemma-1.1-2b-it")
    model = AutoModelForCausalLM.from_pretrained(
        "google/gemma-1.1-2b-it",
        torch_dtype=torch.bfloat16
    )

    with open('prompts/three_shot.txt', "r+") as file:
         input_text = file.read()

    input_ids = tokenizer(input_text, return_tensors="pt")

    outputs = model.generate(**input_ids, max_new_tokens=1500)
    print(tokenizer.decode(outputs[0]))

def test_pre():

    with open('data/tokens_sql.txt', "r+") as file:
         tokens = [line.strip() for line in file.readlines()]

    s = set()
    for w in tokens:
        if w not in s:
            s.add(w)
        else:
            print(w)

    nlData, sqlData = load_dev()
    sqlData = preprocessing(sqlData)    
    #print(sqlData[0])
    sqlTkns = tokenizer(
        sqlData,
        padding="longest",
        truncation=True,
        return_tensors="pt"
        
    ).input_ids
    #print(sqlTkns[0])
    #print(tokenizer.decode(sqlTkns[0]))
    recon = [tokenizer.decode(ex, skip_special_tokens=True) for ex in sqlTkns]

    test = tokenizer("SELECT DISTINCT flight_1.food_service").input_ids[:-1]
    #print(test)
    #print(tokenizer.decode(test))
    
    sql_path = "results/test_pre.sql"
    record_path = "records/test_pre.pkl"

    save_queries_and_records(recon, sql_path, record_path)

    sql_em, record_em, record_f1, model_errors = compute_metrics("data/dev.sql", sql_path, "records/dev_gt_records.pkl", record_path)
    
    print("Sql_em: ", sql_em)
    print("Record_em: ", record_em)
    print("Record_f1:", record_f1)
    

def remove_stop_words(s, stop_words):
    result = s
    for stop in stop_words:
        result = result.replace(stop, " ")
    return result

def remove_stop_list(nl, stop_words):
    return [remove_stop_words(s, stop_words) for s in nl]

def replace_word(s, m):
    result = s
    for key, value in m.items():
        result = result.replace(key, value)
    return result

def replace_strings(nl, m):
    return [replace_word(s, m) for s in nl]

def replace_list(nl, m):
    keys = m.keys()
    nl = [s.split() for s in nl]
    for s in nl:
        for i in range(len(s)):
            if s[i] in keys:
                s[i] = m[s[i]]

    return [' '.join(s) for s in nl]

def preprocessing(nl):
    stop_p = load_stop_phrases()
    stop_w = load_stop_words()
    single, multi = load_replacements()
    
    nl = remove_stop_list(nl, stop_p)

    nl = replace_strings(nl, multi)

    nl = replace_list(nl, single)

    nl = remove_words(nl, stop_w)

    return nl

def main():

    t_old = T5TokenizerFast.from_pretrained('google-t5/t5-small', padding_side="right")
    trainNL, trainSQL = load_train()
    
    devNL, devSQL = load_dev()
    """
    with open('data/train.sql', "r+") as file:
         testSQL = file.readlines()
         testSQL = [line.strip() for line in testSQL]

    with open('data/tokens_sql.txt', "r+") as file:
         tkns = [line.replace('\n', '') 
         for line in file.readlines()]

    s = get_unique_set([line.split() for line in trainSQL])
    for w in s:
        if w[0] == "'" and w not in tkns:
            print(w)

    with open('data/dev.nl', "r+") as file:
         trainNL = [line.replace('\n', '') 
         for line in file.readlines()]
    
    new = preprocessing(trainNL)

    with open('data/nl_post.nl', "w+") as file:
        for ex in new:
            print(" ".join(ex.split()), file=file)

    return
    """
    train_nl_tkns = [t_old(ex).input_ids for ex in trainNL]
    train_sql_tkns = [t_old(SOS + ex).input_ids for ex in trainSQL]

    dev_nl_tkns = [t_old(ex).input_ids for ex in devNL]
    dev_sql_tkns = [t_old(SOS + ex).input_ids for ex in devSQL]

    print("\t Training NL Stats")
    print_statistics(train_nl_tkns)

    print("\t Training SQL Stats")
    print_statistics(train_sql_tkns)

    print(trainNL[0])

    print("\t Dev NL Stats")
    print_statistics(dev_nl_tkns)

    print("\t Dev SQL Stats")
    print_statistics(dev_sql_tkns)

    post_train = preprocessing(trainNL)
    post_dev = preprocessing(devNL)

    post_train_nl_tkns = [tokenizer(ex.split(), is_split_into_words=True).input_ids for ex in post_train]
    post_dev_nl_tkns = [tokenizer(ex.split(), is_split_into_words=True).input_ids for ex in post_dev]

    post_train_sql_tkns = [tokenizer(ex).input_ids for ex in preprocessing(trainSQL)]
    post_dev_sql_tkns = [tokenizer(ex).input_ids for ex in preprocessing(devSQL)]

    print("\t Post Train NL Stats")
    print_statistics(post_train_nl_tkns)

    print("\t Post Train SQL Stats")
    print_statistics(post_train_sql_tkns)

    print("\t Post Dev NL Stats")
    print_statistics(post_dev_nl_tkns)

    print("\t Post Dev SQL Stats")
    print_statistics(post_dev_sql_tkns)
    """
    for x in post_train_sql_tkns:
        x = torch.tensor(x)
        x[x > 30000] = 0
        print(tokenizer.decode(x, skip_special_tokens = True))
    """
    print("Space token: ", tokenizer(' ').input_ids[0])
    x = tokenizer(["hello world".split(), "la_guardia_airport".split()], padding="longest", is_split_into_words=True)
    print(x.input_ids)
    print(x.attention_mask)
    print(trainNL[0])
    print(train_nl_tkns[0])
    print(post_train_nl_tkns[0])


if __name__ == "__main__":
    main()
    #test_b2()
    #test_pre()
