import os, random, re, string
from collections import Counter
from tqdm import tqdm
import pickle

from torch.utils.data import Dataset, DataLoader
from torch.nn.utils.rnn import pad_sequence

import nltk
nltk.download('punkt')
from transformers import T5TokenizerFast
import torch

PAD_IDX = 0

class T5Dataset(Dataset):

    
    SOS = "<extra_id_1>"
    EOS = "<extra_id_2>"
    Tokenizer = T5TokenizerFast.from_pretrained('google-t5/t5-small')
    SOS_IDX = torch.tensor([Tokenizer(SOS).input_ids])
    EOS_IDX = torch.tensor([Tokenizer(EOS).input_ids])

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
      
        tokenizer = T5Dataset.Tokenizer

        with open(data_folder + '/' + split + '.nl', "r+") as file:
            nlData = file.readlines()
            self.nl = [torch.Tensor(tokenizer(x).input_ids) for x in nlData]


        if not self.test:
            with open(data_folder + '/' + split + '.sql', "r+") as file:
                sqlData = file.readlines()
                # extra_id_0 serves as beginning of sentence
                self.sql = [torch.Tensor(tokenizer(T5Dataset.SOS + x).input_ids) for x in sqlData]
                
        
    def process_data(self, data_folder, split, tokenizer):
        
        test = split == 'test'

        with open(data_folder + '/' + split + '.nl', "r+") as file:
            nlData = file.readlines()
            nl = [torch.Tensor(tokenizer(x).input_ids) for x in nlData]


        if not test:
            with open(data_folder + '/' + split + '.sql', "r+") as file:
                sqlData = file.readlines()
                # extra_id_0 serves as beginning of sentence
                sql = [torch.Tensor(tokenizer(T5Dataset.SOS + x).input_ids) for x in sqlData]

        if test:
            return nl
        else:
            return (nl, sql)
        
    
    def __len__(self):
        return len(self.nl)

    def __getitem__(self, idx):
        if self.test:
            return self.nl[idx]
        else:
            return (self.nl[idx], self.sql[idx])

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
    sql = [item[1] for item in batch]
    target = [item[1][1:] for item in batch]

    padding = torch.tensor([[0] for i in range(len(batch))])

    encoder_ids = pad_sequence(nl, True).to(torch.long)
    encoder_mask = encoder_ids == 0

    decoder_inputs = pad_sequence(sql, True).to(torch.long)
    decoder_targets = torch.cat((pad_sequence(target, True), padding), dim=1).to(torch.long)

    initial_decoder_inputs = T5Dataset.SOS


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
    encoder_ids = pad_sequence(batch, True).to(torch.long)
    encoder_mask = encoder_ids == 0

    initial_decoder_inputs = T5Dataset.start_token

    return encoder_ids, encoder_mask, initial_decoder_inputs

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
    # TODO
    return train_x, train_y, dev_x, dev_y, test_x