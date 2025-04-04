import os
import argparse
from tqdm import tqdm

import torch
import math

import torch.nn as nn
import numpy as np
import wandb

from t5_utils import initialize_model, initialize_optimizer_and_scheduler, save_model, load_model_from_checkpoint, setup_wandb, Tokens
from transformers import GenerationConfig
from load_data import load_t5_data, T5Dataset
from utils import compute_metrics, save_queries_and_records, compute_record_F1, load_queries_and_records
from transformers import T5TokenizerFast

DEVICE = torch.device('cuda') if torch.cuda.is_available() else torch.device('cpu')
#DEVICE = torch.device('cpu')
PAD_IDX = 0

def get_args():
    '''
    Arguments for training. You may choose to change or extend these as you see fit.
    '''
    parser = argparse.ArgumentParser(description='T5 training loop')

    # Model hyperparameters
    parser.add_argument('--finetune', action='store_true', help="Whether to finetune T5 or not")
    
    # Training hyperparameters
    parser.add_argument('--optimizer_type', type=str, default="AdamW", choices=["AdamW"],
                        help="What optimizer to use")
    parser.add_argument('--learning_rate', type=float, default=2e-2)
    parser.add_argument('--weight_decay', type=float, default=0)

    parser.add_argument('--scheduler_type', type=str, default="cosine", choices=["none", "cosine", "linear"],
                        help="Whether to use a LR scheduler and what type to use if so")
    parser.add_argument('--num_warmup_epochs', type=int, default=1,
                        help="How many epochs to warm up the learning rate for if using a scheduler")
    parser.add_argument('--max_n_epochs', type=int, default=0,
                        help="How many epochs to train the model for")
    parser.add_argument('--patience_epochs', type=int, default=2,
                        help="If validation performance stops improving, how many epochs should we wait before stopping?")

    parser.add_argument('--use_wandb', action='store_true',
                        help="If set, we will use wandb to keep track of experiments")
    parser.add_argument('--experiment_name', type=str, default='experiment',
                        help="How should we name this experiment?")

    # Data hyperparameters
    parser.add_argument('--batch_size', type=int, default=8)
    parser.add_argument('--test_batch_size', type=int, default=8)

    args = parser.parse_args()
    return args

def train(args, model, train_loader, dev_loader, optimizer, scheduler):
    
    epochs_since_improvement = 0

    model_type = 'ft' if args.finetune else 'scr'
    checkpoint_dir = os.path.join('checkpoints', f'{model_type}_experiments', args.experiment_name)
    gt_sql_path = os.path.join(f'data/dev.sql')
    gt_record_path = os.path.join(f'records/ground_truth_dev.pkl')
    model_sql_path = os.path.join(f'results/t5_{model_type}_{args.experiment_name}_dev.sql')
    model_record_path = os.path.join(f'records/t5_{model_type}_{args.experiment_name}_dev.pkl')


    for epoch in range(args.max_n_epochs):
        
        tr_loss = train_epoch(args, model, train_loader, optimizer, scheduler)
        """
        eval_loss, record_f1, record_em, sql_em, error_rate = eval_epoch(args, model, dev_loader,
                                                                         gt_sql_path, model_sql_path,
                                                                         gt_record_path, model_record_path, True)
        
        print(f"Epoch {epoch}: Average train loss was {tr_loss}")
        print(f"Epoch {epoch}: Dev loss: {eval_loss}, Record F1: {record_f1}, Record EM: {record_em}, SQL EM: {sql_em}")
        print(f"Epoch {epoch}: {error_rate*100:.2f}% of the generated outputs led to SQL errors")

        if args.use_wandb:
            result_dict = {
                'train/loss' : tr_loss,
                'dev/loss' : eval_loss,
                'dev/record_f1' : record_f1,
                'dev/record_em' : record_em,
                'dev/sql_em' : sql_em,
                'dev/error_rate' : error_rate,
            }
            wandb.log(result_dict, step=epoch)

        if record_f1 > best_f1:
            best_f1 = record_f1
            epochs_since_improvement = 0
        else:
            epochs_since_improvement += 1
        """
        print("Training loss: ", tr_loss)
        print("Dev f1: ", estimate_f1(args, model, dev_loader))
        save_model(checkpoint_dir, model, best=False)
        """
        if epochs_since_improvement == 0:
            save_model(checkpoint_dir, model, best=True)

        if epochs_since_improvement >= args.patience_epochs:
            break
        """

def estimate_f1(args, model, dev_loader):
    model.eval()
    total_loss = 0
    total_tokens = 0
    criterion = nn.CrossEntropyLoss()

    with torch.no_grad():

        for encoder_input, encoder_mask, decoder_input, decoder_targets, _ in tqdm(dev_loader):
            encoder_input = encoder_input.to(DEVICE)
            encoder_mask = encoder_mask.to(DEVICE)
            decoder_input = decoder_input.to(DEVICE)
            decoder_targets = decoder_targets.to(DEVICE)

            logits = model(
                input_ids=encoder_input,
                attention_mask=encoder_mask,
                decoder_input_ids=decoder_input
            )['logits']

            non_pad = decoder_targets != PAD_IDX
            loss = criterion(logits[non_pad], decoder_targets[non_pad])

            num_tokens = torch.sum(non_pad).item()
            total_loss += loss.item() * num_tokens
            total_tokens += num_tokens
        
    return total_loss / total_tokens


def train_epoch(args, model, train_loader, optimizer, scheduler):
    model.train()

    model.to(DEVICE)
    total_loss = 0
    total_tokens = 0
    criterion = nn.CrossEntropyLoss()

    for encoder_input, encoder_mask, decoder_input, decoder_targets, _ in tqdm(train_loader):
        
        optimizer.zero_grad()
        encoder_input = encoder_input.to(DEVICE)
        encoder_mask = encoder_mask.to(DEVICE)
        decoder_input = decoder_input.to(DEVICE)
        decoder_targets = decoder_targets.to(DEVICE)

        #print(encoder_input.size())
        #print(encoder_mask.size())
        #print(decoder_input.size())
        #print(decoder_targets.size())

        logits = model(
            input_ids=encoder_input,
            attention_mask=encoder_mask,
            decoder_input_ids=decoder_input
        )['logits']

        non_pad = decoder_targets != PAD_IDX
        loss = criterion(logits[non_pad], decoder_targets[non_pad])
        loss.backward()
        optimizer.step()
        if scheduler is not None: 
            scheduler.step()

        with torch.no_grad():
            num_tokens = torch.sum(non_pad).item()
            total_loss += loss.item() * num_tokens
            total_tokens += num_tokens

    return total_loss / total_tokens
        
def eval_epoch(args, model, dev_loader, gt_sql_pth, model_sql_path, gt_record_path, model_record_path, training=False):
    '''
    You must implement the evaluation loop to be using during training. We recommend keeping track
    of the model loss on the SQL queries, the metrics compute_metrics returns (save_queries_and_records should be helpful)
    and the model's syntax error rate. 

    To compute non-loss metrics, you will need to perform generation with the model. Greedy decoding or beam search
    should both provide good results. If you find that this component of evaluation takes too long with your compute,
    we found the cross-entropy loss (in the evaluation set) to be well (albeit imperfectly) correlated with F1 performance.
    '''
    dev_loss = record_f1 = record_em = sql_em = dev_error_rate = 0
    total_loss = total_tokens = 0

    sql_queries = []
    model.eval()
    model.to(DEVICE)
    criterion = nn.CrossEntropyLoss()

    with torch.no_grad():
        for encoder_input, encoder_mask, decoder_input, decoder_targets, initial_decoder_inputs in tqdm(dev_loader):
            encoder_input = encoder_input.to(DEVICE)
            encoder_mask = encoder_mask.to(DEVICE)
            decoder_input = decoder_input.to(DEVICE)
            decoder_targets = decoder_targets.to(DEVICE)
            initial_decoder_inputs = initial_decoder_inputs.to(DEVICE)

            if not training:
                logits = model(
                    input_ids=encoder_input,
                    attention_mask=encoder_mask,
                    decoder_input_ids=decoder_input
                )['logits']

                non_pad = decoder_targets != PAD_IDX
                loss = criterion(logits[non_pad], decoder_targets[non_pad])

                num_tokens = torch.sum(non_pad).item()
                if not math.isnan(loss.item()):
                    total_loss += loss.item() * num_tokens
                total_tokens += num_tokens

            #print(encoder_input)
            output = model.generate(
                input_ids = encoder_input,
                attention_mask = encoder_mask,
                decoder_input_ids=initial_decoder_inputs,
                max_new_tokens=250
            )
            
            sql = Tokens.Tokenizer.batch_decode(output, skip_special_tokens=True)
            
            sql_queries.extend(sql)

        save_queries_and_records(sql_queries, model_sql_path, model_record_path)

        
        sql_em, record_em, record_f1, model_error_msgs = compute_metrics(gt_sql_pth, model_sql_path, gt_record_path, model_record_path)
        
        if not training:
            dev_loss = total_loss / total_tokens
            errors = [1 if "error" in msg or "Error" in msg else 0 for msg in model_error_msgs]
            dev_error_rate = sum(errors) / len(errors)

    # dev_loss, dev_record_em, dev_record_f1, dev_sql_em, dev_error_rate
    return dev_loss, record_f1, record_em, sql_em, dev_error_rate
        
def test_inference(args, model, test_loader, model_sql_path, model_record_path):
    '''
    You must implement inference to compute your model's generated SQL queries and its associated 
    database records. Implementation should be very similar to eval_epoch.
    '''

    sql_queries = []
    model.eval()
    model.to(DEVICE)
    for encoder_ids, encoder_mask, initial_decoder_inputs in tqdm(test_loader):
        encoder_input = encoder_ids.to(DEVICE)
        encoder_mask = encoder_mask.to(DEVICE)
        decoder_input = initial_decoder_inputs.to(DEVICE)
        #print(encoder_input, encoder_mask, decoder_input)

        output = model.generate(
            input_ids = encoder_input,
            attention_mask = encoder_mask,
            decoder_input_ids=decoder_input,
            max_new_tokens=250
        )

        #print(output[0])

        sql = Tokens.Tokenizer.batch_decode(output, skip_special_tokens=True)
        sql_queries.extend(sql)

    save_queries_and_records(sql_queries, model_sql_path, model_record_path)

def test_generation(model):

    #tokenizer = T5TokenizerFast.from_pretrained('google-t5/t5-small', padding_side="left")
    tokenizer = Tokens.Tokenizer
    tokenizer.add_tokens(["Long Beach", "SELECT ", "DISTINCT ", " flight_1"])
    nl = "Long Beach to Toronto"
    sql = "SELECT DISTINCT flight_1.flight_id FROM flight flight_1"

    nl_tkns = tokenizer(nl).input_ids
    sql_tkns = tokenizer(sql).input_ids

    print(nl_tkns)
    print(tokenizer.decode(nl_tkns, skip_special_tokens=True))

    print(sql_tkns)
    print(tokenizer.decode(sql_tkns, skip_special_tokens=True))


    """
    inputs = [
        "What do i want for lunch switz h",
        "What is this in my calendar",
        "Baltimore to Toronto"
    ]
    for x in inputs:
        print(x)

    start_token = tokenizer("Get flights from Toronto to Newark").input_ids
    print("Start token: ", tokenizer.decode(start_token))

    end = "SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport airport_1 , airport_service airport_service_1 , city city_1 WHERE flight_1.to_airport = airport_1.airport_code AND airport_1.airport_code = 'MKE' AND flight_1.from_airport = airport_service_1.airport_code AND airport_service_1.city_code = city_1.city_code AND 1 = 1"

    print(tokenizer(Tokens.SOS + end).input_ids[:-1])

    nl = tokenizer(inputs, padding="longest", return_tensors="pt")
    #print(nl.input_ids)

    m_out = model.generate(
        **nl,
        decoder_start_token_id=Tokens.SOS_IDX
    )

    print(m_out)

    output = tokenizer.batch_decode(m_out, skip_special_tokens=False)
    #print(tokenizer.decode([32099, 1], skip_special_tokens=True))
    
    for x in output:
        print(x)
    """



def main():
    # Get key arguments
    args = get_args()
    if args.use_wandb:
        # Recommended: Using wandb (or tensorboard) for result logging can make experimentation easier
        setup_wandb(args)


    # Load the data and the model
    train_loader, dev_loader, test_loader = load_t5_data(args.batch_size, args.test_batch_size)
    model = initialize_model(args)
    optimizer, scheduler = initialize_optimizer_and_scheduler(args, model, len(train_loader))

    # Train 
    train(args, model, train_loader, dev_loader, optimizer, scheduler)

    # Evaluate
    model = load_model_from_checkpoint(args, best=True)
    model.eval()

    #test_generation(model)
    
    # Dev set
    experiment_name = args.experiment_name
    model_type = 'ft' if args.finetune else 'scr'
    gt_sql_path = os.path.join(f'data/dev.sql')
    gt_record_path = os.path.join(f'records/ground_truth_dev.pkl')
    model_sql_path = os.path.join(f'results/t5_{model_type}_{experiment_name}_dev.sql')
    model_record_path = os.path.join(f'records/t5_{model_type}_{experiment_name}_dev.pkl')
    
    dev_loss, dev_record_f1, dev_record_em, dev_sql_em, dev_error_rate = eval_epoch(args, model, dev_loader,
                                                                                    gt_sql_path, model_sql_path,
                                                                                    gt_record_path, model_record_path)
    print(f"Dev set results: Loss: {dev_loss}, Record F1: {dev_record_f1}, Record EM: {dev_record_em}, SQL EM: {dev_sql_em}")
    print(f"Dev set results: {dev_error_rate*100:.2f}% of the generated outputs led to SQL errors")
    
    
    # Test set
    model_sql_path = os.path.join(f'results/t5_{model_type}_{experiment_name}_test.sql')
    model_record_path = os.path.join(f'records/t5_{model_type}_{experiment_name}_test.pkl')
    test_inference(args, model, test_loader, model_sql_path, model_record_path)

if __name__ == "__main__":
    main()
