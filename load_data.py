import os, random, re, string
from collections import Counter
from tqdm import tqdm
import pickle

from torch.utils.data import Dataset, DataLoader
from torch.nn.utils.rnn import pad_sequence
from preprocessing import preprocessing

import nltk
nltk.download('punkt')
from transformers import T5TokenizerFast
import torch
from t5_utils import Tokens

PAD_IDX = 0


class T5Dataset(Dataset):

    def __init__(self, data_folder, split):
        '''
        Skeleton for the class for performing data processing for the T5 model.

        Some tips for implementation:
            * You should be using the 'google-t5/t5-small' tokenizer checkpoint to tokenize both
              the encoder and decoder output. 
            * You want to provide the decoder some beginning of sentence token. Any extra-id on the
              T5Tokenizer should serve that purpose.
            * Class behavior should be different on the test set.
        '''

        self.test = split == 'test'
      
        self.tokenizer = Tokens.Tokenizer
        
        with open(data_folder + '/' + split + '.nl', "r+") as file:
            nlData = [line.strip() for line in file.readlines()]
            nlData = preprocessing(nlData)
            
            nlData = [self.tokenizer(ex).input_ids for ex in nlData]

            nlData = [[id for id in element if id != Tokens.Space and id != 1 ] for element in nlData]

            nlData = pad_sequence([torch.tensor(ex) for ex in nlData], batch_first=True)

            self.input_ids = nlData
            self.attention_mask = (nlData != PAD_IDX).long()
            
        if not self.test:
            with open(data_folder + '/' + split + '.sql', "r+") as file:
                sqlData = file.readlines()
                sqlData = [Tokens.SOS + x for x in sqlData]
                sqlData = preprocessing(sqlData)
                target = self.tokenizer(
                    sqlData,
                    padding="longest",
                    truncation=True,
                    return_tensors="pt"
                )

                labels = target.input_ids[:,:-1]
                labels[labels == self.tokenizer.pad_token_id] = PAD_IDX

                self.labels = labels

                # extra_id_1 serves as beginning of sentence                
        
    def process_data(self, data_folder, split, tokenizer):
        
        test = split == 'test'

        with open(data_folder + '/' + split + '.nl', "r+") as file:
            nlData = file.readlines()
            nl = [torch.Tensor(tokenizer(x).input_ids) for x in nlData]


        if not test:
            with open(data_folder + '/' + split + '.sql', "r+") as file:
                sqlData = file.readlines()
                # extra_id_1 serves as beginning of sentence
                sql = [torch.Tensor(tokenizer(Tokens.SOS + x).input_ids) for x in sqlData]

        if test:
            return nl
        else:
            return (nl, sql)
        
    
    def __len__(self):
        return len(self.input_ids)

    def __getitem__(self, idx):
        if self.test:
            return [self.input_ids[idx], self.attention_mask[idx]]
        else:
            return [self.input_ids[idx], self.attention_mask[idx], self.labels[idx]]

def normal_collate_fn(batch):
    '''
    Collation function to perform dynamic padding for training and evaluation with the
    development or validation set.

    Inputs:
        * batch (List[Any]): batch is a list of length batch_size, where each index contains what
                             the dataset __getitem__ function returns.

    Returns: To be compatible with the provided training loop, you should be returning
        * encoder_ids: The input ids of shape BxT to be fed into the T5 encoder.
        * encoder_mask: Mask of shape BxT associated with padding tokens in the encoder input
        * decoder_inputs: Decoder input ids of shape BxT' to be fed into T5 decoder.
        * decoder_targets: The target tokens with which to train the decoder (the tokens following each decoder input)
        * initial_decoder_inputs: The very first input token to be decoder (only to be used in evaluation)
    '''

    
    nl = [item[0] for item in batch]
    encoder_ids = pad_sequence(nl, True)

    mask = [item[1] for item in batch]
    encoder_mask = pad_sequence(mask, True)
    
    sql = [item[2] for item in batch]
    decoder_inputs = pad_sequence(sql, True)

    padding = torch.tensor([[PAD_IDX] for i in range(len(batch))])

    decoder_targets = decoder_inputs[:,1:]
    decoder_targets = torch.cat((decoder_targets, padding), dim=1)

    initial_decoder_inputs = torch.tensor([[Tokens.SOS_IDX]] * len(batch))

    return encoder_ids, encoder_mask, decoder_inputs, decoder_targets, initial_decoder_inputs

def test_collate_fn(batch):
    '''
    Collation function to perform dynamic padding for inference on the test set.

    Inputs:
        * batch (List[Any]): batch is a list of length batch_size, where each index contains what
                             the dataset __getitem__ function returns.

    Recommended returns: 
        * encoder_ids: The input ids of shape BxT to be fed into the T5 encoder.
        * encoder_mask: Mask of shape BxT associated with padding tokens in the encoder input
        * initial_decoder_inputs: The very first input token to be decoder (only to be used in evaluation)
    '''
    
    nl = [item[0] for item in batch]
    encoder_ids = pad_sequence(nl, True).to(torch.long)

    mask = [item[1] for item in batch]
    encoder_mask = pad_sequence(mask, True).to(torch.long)

    decoder_inputs = torch.tensor([[Tokens.SOS_IDX] for i in range(len(batch))])

    return encoder_ids, encoder_mask, decoder_inputs

def get_dataloader(batch_size, split):
    data_folder = 'data'
    dset = T5Dataset(data_folder, split)
    shuffle = split == "train"
    collate_fn = normal_collate_fn if split != "test" else test_collate_fn

    dataloader = DataLoader(dset, batch_size=batch_size, shuffle=shuffle, collate_fn=collate_fn)
    return dataloader

def load_t5_data(batch_size, test_batch_size):
    train_loader = get_dataloader(batch_size, "train")
    dev_loader = get_dataloader(test_batch_size, "dev")
    test_loader = get_dataloader(test_batch_size, "test")
    
    return train_loader, dev_loader, test_loader


def load_lines(path):
    with open(path, 'r') as f:
        lines = f.readlines()
        lines = [line.strip() for line in lines]
    return lines

def load_prompting_data(data_folder):

    train_x = load_lines(data_folder + '/train.nl')
    train_y = load_lines(data_folder + '/train.sql')

    dev_x = load_lines(data_folder + '/dev.nl')
    dev_y = load_lines(data_folder + '/dev.sql')

    test_x = load_lines(data_folder + '/test.nl')

    return train_x, train_y, dev_x, dev_y, test_x