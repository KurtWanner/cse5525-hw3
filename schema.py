import json





def print_table(name, table):
	type_map = {"INTEGER" : "int"}
	result = f"CREATE TABLE {name} ("
	for el in table['ents'][name]:
		_type = table['ents'][name][el]['type'] if table['ents'][name][el]['type'] not in type_map else type_map[table['ents'][name][el]['type']]
		result += f"\n\t{el} {_type},"
		
	result = result[:-1]
	result += "\n);"

	return result



def main():
	with open('data/flight_database.schema') as f:
		data = json.load(f)

	
	tables = [el for el in data['ents']]

	for name in tables:
		print_table(name, data)


	
if __name__ == "__main__":
    main()