import os
import json
from preprocessing import replace_list, replace_strings, remove_stop_list, remove_words

with open("data/prompt_key_words.txt", "r") as f:
    key_words = [line.strip() for line in f.readlines()]

def print_table(name, table):
	type_map = {"INTEGER" : "int"}
	result = f"CREATE TABLE {name} ("
	for el in table['ents'][name]:
		_type = table['ents'][name][el]['type'] if table['ents'][name][el]['type'] not in type_map else type_map[table['ents'][name][el]['type']]
		result += f"\n\t{el} {_type},"
		
	result = result[:-1]
	result += "\n);"

	return result

def read_schema(schema_path):
    '''
    Read the .schema file
    '''
    with open("data/flight_database.schema", "r") as f:
        data = json.load(f)
    
    ids = [el for el in data['ents']]

    tables = [print_table(name, data) for name in ids]

    return "\n".join(tables)

def process_nl(nl):
    with open("data/prompting_replacements_multi.txt", "r") as f:
        multi = dict(tuple(x.replace('\n', '') for x in line.split('\t'))
            for line in f.readlines())

    with open("data/prompting_replacements_single.txt", "r") as f:
        single = dict(tuple(x.replace('\n', '') for x in line.split('\t'))
            for line in f.readlines())

    with open('data/prompting_stopwords.txt', "r+") as file:
         stop = [line.strip() for line in file.readlines()]

    #nl = remove_words(nl, stop)
    nl = replace_strings(nl, multi)
    nl = replace_list(nl, single)

    return nl

def get_key_words(nl):
    keys = []
    l = nl.split()
    for key in key_words:
        if ' ' in key:
            if key in nl and key not in keys:
                keys.append(key)
        else:
            if key in l and key not in keys:
                keys.append(key)

    return keys
    
def extract_sql_query(response):
    '''
    Extract the SQL query from the model's response
    '''

    start_index = response.rfind("[Answer]") + 10

    sql = response[start_index:]

    sql = sql.replace('\n', ' ') \
          .replace('JOIN', ',') \
          .replace(';', '')\
          .replace("`", '')\
          .replace("sql",'')

    sql = ' '.join(sql.split())
    
    #print(sql)
    
    return sql 

def save_logs(output_path, sql_em, record_em, record_f1, error_msgs):
    '''
    Save the logs of the experiment to files.
    You can change the format as needed.
    '''
    with open(output_path, "w") as f:
        f.write(f"SQL EM: {sql_em}\nRecord EM: {record_em}\nRecord F1: {record_f1}\nModel Error Messages: {error_msgs}\n")