import os, random, re, string
from collections import Counter
from tqdm import tqdm
import pickle

from torch.utils.data import Dataset, DataLoader
from torch.nn.utils.rnn import pad_sequence

import nltk
from transformers import T5TokenizerFast, AutoTokenizer, AutoModelForCausalLM
import torch

tokenizer = T5TokenizerFast.from_pretrained('google-t5/t5-small')
SOS = "<extra_id_1>"


def load_train():
    with open('data/train.nl', "r+") as file:
         nlData = file.readlines()

             
    with open('data/train.sql', "r+") as file:
         sqlData = file.readlines()

    return (nlData, sqlData)
    

def load_dev():
    with open('data/dev.nl', "r+") as file:
         nlData = file.readlines()

             
    with open('data/dev.sql', "r+") as file:
         sqlData = file.readlines()

    return (nlData, sqlData)

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


def main():

    trainNL, trainSQL = load_train()

    devNL, devSQL = load_dev()

    train_nl_data = [ex.split(' ') for ex in trainNL]
    
    train_sql_data = [ex.split(' ') for ex in trainSQL]

    dev_nl_data = [ex.split(' ') for ex in devNL]

    dev_sql_data = [ex.split(' ') for ex in devSQL]

    """
    print("\t Training NL Stats")
    print_statistics(train_nl_data)

    print("\t Training SQL Stats")
    print_statistics(train_sql_data)

    print("\t Dev NL Stats")
    print_statistics(dev_nl_data)

    print("\t Dev NL Stats")
    print_statistics(dev_sql_data)
    """

    train_nl_tkns = [tokenizer(ex).input_ids for ex in trainNL]
    train_sql_tkns = [tokenizer(SOS + ex).input_ids for ex in trainSQL]

    
    dev_nl_tkns = [tokenizer(ex).input_ids for ex in devNL]
    dev_sql_tkns = [tokenizer(SOS + ex).input_ids for ex in devSQL]

    print("\t Training NL Stats")
    print_statistics(train_nl_tkns)

    print("\t Training SQL Stats")
    print_statistics(train_sql_tkns)

    print("\t Dev NL Stats")
    print_statistics(dev_nl_tkns)

    print("\t Dev NL Stats")
    print_statistics(dev_sql_tkns)



if __name__ == "__main__":
    #main()
    test_b2()

