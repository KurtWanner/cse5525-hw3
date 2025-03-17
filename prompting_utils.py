import os


def read_schema(schema_path):
    '''
    Read the .schema file
    '''
    # TODO

def extract_sql_query(response):
    '''
    Extract the SQL query from the model's response
    '''

    start_index = response.rfind("sql") + 3
    end_index = response.rfind('```')

    sql = response[start_index:end_index]

    sql = sql.replace('\n', ' ') \
          .replace('JOIN', ',') \
          .replace(';', '')

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