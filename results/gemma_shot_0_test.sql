SELECT * FROM flights WHERE departure_city = 'Dallas' AND destination_city = 'Phoenix'
SELECT flight_id, origin, destination FROM flights WHERE origin IN ('phoenix', 'salt lake city')
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND arrival_city = 'Denver'
SELECT DISTINCT types FROM transportation WHERE location = 'Denver'
SELECT * FROM flights WHERE departure_city = 'DEN' AND departure_date = '2023-10-27' AND departure_time = '09:00' AND arrival_city = 'STL'
SELECT * FROM transportation WHERE location = 'St. Louis'
SELECT * FROM flights WHERE departure_city = 'St. Louis' AND departure_date = 'Wednesday' AND departure_time BETWEEN '17:00:00' AND '19:00:00'
SELECT * FROM flights WHERE departure_city = 'Washington' AND arrival_city = 'Seattle'
SELECT * FROM flights WHERE departure_city = 'Atlanta' AND destination_city = 'Seattle'
SELECT * FROM flights WHERE departure_city = 'San Diego' AND destination_city = 'Seattle'
SELECT * FROM flights WHERE origin = 'PHOENIX' AND destination = 'DENVER'
SELECT * FROM flights WHERE departure_city = 'Salt Lake City' AND destination_city = 'Phoenix'
SELECT * FROM flights WHERE departure_city = 'PIT' AND destination_city = 'PHO'
SELECT * FROM flights WHERE departure_city = 'Washington Dulles International Airport' AND destination_city = 'Denver International Airport'
SELECT * FROM flights WHERE departure_date = '2023-06-01' AND departure_time = '12:00:00' AND departure_origin = 'WA' AND departure_destination = 'BO'
SELECT * FROM flights WHERE departure_city = 'WA' AND destination_city = 'MTL' AND day = 'Sat'
SELECT fares FROM flights WHERE departure_city = 'WA' AND arrival_city = 'TO' AND day = 'Sat' AND date = '2023-10-27'
SELECT * FROM trips WHERE departure_date = 'Saturday' AND departure_time = '12:00 PM'
SELECT * FROM flights WHERE departure_time < '12:00:00' AND departure_city = 'Cleveland' AND arrival_city = 'Dallas'
SELECT * FROM fares WHERE origin = 'WA' AND destination = 'BO'
SELECT * FROM fares WHERE date = '2023-06-06' AND origin = 'WA' AND destination = 'BO'
SELECT * FROM fares WHERE origin = 'WA' AND destination = 'MT'
SELECT * FROM fares WHERE departure_city = 'Washington' AND arrival_city = 'Montreal' AND travel_date = 'Saturday'
SELECT * FROM fares WHERE date BETWEEN '2023-06-01' AND '2023-06-07' AND origin = 'Washington' AND destination = 'Toronto'
SELECT fare FROM fares WHERE date = '2023-06-06' AND origin = 'Washington' AND destination = 'Toronto'
SELECT * FROM flights WHERE departure_city = 'Washington' AND arrival_city = 'Boston'
SELECT * FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'Washington'
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND destination_city = 'DTW'
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND arrival_city = 'Detroit'
SELECT * FROM flights WHERE departure_city = 'Detroit' AND arrival_city = 'Toronto'
SELECT * FROM flights WHERE origin = 'TOR' AND destination = 'MIL'
SELECT * FROM flights WHERE departure_city = 'OAK' AND destination_city = 'SLC' AND day = 'THURSDAY'
SELECT * FROM flights WHERE departure_city = 'OAKLAND' AND destination_city = 'SLC' AND departure_date = '2023-10-27' AND departure_time = '19:00'
SELECT flight_date FROM flights WHERE flight_origin = 'OAK' AND flight_destination = 'SLC' AND flight_date = (SELECT MAX(flight_date) FROM flights WHERE flight_origin = 'OAK' AND flight_destination = 'SLC' AND flight_date < CURRENT_DATE)
SELECT * FROM flights WHERE departure_city = 'Toronto' AND arrival_city = 'San Diego' AND stops = 'DTW'
SELECT * FROM flights WHERE departure_city = 'St. Petersburg' AND arrival_city = 'Charlotte'
SELECT * FROM flights WHERE departure_time >= '2023-10-27 09:00:00' AND departure_time < '2023-10-27 12:00:00'
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND departure_time < '8:00:00' AND departure_date = 'Monday'
SELECT * FROM transportation_options WHERE location = 'Indianapolis' AND transportation_type = 'ground'
SELECT * FROM flights WHERE departure_city = 'Indianapolis' AND departure_date = 'Tuesday' AND departure_time = '12:00:00'
SELECT * FROM flights WHERE departure_city = 'Cleveland' AND departure_date = 'Wednesday' AND departure_time >= '18:00:00'
SELECT * FROM flights WHERE departure_city = 'Cleveland' AND destination_city = 'Milwaukee' AND departure_time >= '17:00' AND departure_time < '19:00'
SELECT * FROM flights WHERE departure_city = 'Cleveland' AND departure_date = 'Wednesday' AND departure_time >= '19:00:00'
SELECT * FROM flights WHERE departure_city = 'Cleveland' AND departure_date = 'Wednesday' AND departure_time >= '19:00:00'
SELECT * FROM flights WHERE departure_city = 'Denver' AND destination_city = 'Salt Lake City' AND day = 'Monday'
SELECT * FROM transportation_options WHERE location = 'Denver International Airport' AND availability = 'Yes'
SELECT * FROM flights WHERE departure_date = '2023-10-27' AND departure_time > 17:00 AND departure_origin = 'DEN' AND arrival_origin = 'SLC'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: is there ground transportation available at the salt lake city airport [Answer]: ``` SELECT * FROM transportation_options WHERE location = 'Salt Lake City Airport' AND (type = 'Bus' OR type = 'Train')
SELECT * FROM flights WHERE departure_city = 'Salt Lake City' AND departure_date = 'Wednesday' AND departure_time > '17:00:00'
SELECT * FROM transportation_options WHERE location = 'Phoenix Airport' AND availability = 'Yes'
SELECT * FROM flights WHERE departure_date = '2023-10-27' AND departure_time >= 18:00 AND departure_city = 'Oakland' AND arrival_city = 'Salt Lake City'
SELECT * FROM flights WHERE departure_date = '2023-10-27' AND departure_time < '09:00:00' AND origin = 'OAKL' AND destination = 'SLC'
SELECT * FROM flights WHERE departure_city = 'Oakland' AND departure_date = 'Thursday' AND departure_time <= 8000 AND arrival_city = 'Salt Lake City'
SELECT flight_number, airline FROM flights WHERE departure_city = 'Oakland' AND departure_time < '8:00:00' AND departure_date = 'Thursday'
SELECT flight_number FROM flights WHERE departure_date = '2023-04-10' AND departure_time < '08:00:00' AND origin = 'OAKLAND' AND destination = 'SLC'
SELECT DISTINCT airport_name FROM airports WHERE state IN ('Arizona', 'Nevada') ORDER BY airport_name
SELECT * FROM airports WHERE state IN ('CA', 'NV', 'AZ')
SELECT * FROM airports WHERE airport_name = 'Arizona Airport'
SELECT * FROM airports WHERE state = 'California'
SELECT * FROM flights WHERE departure_city = 'LAS' AND arrival_city = 'PHOENIX'
SELECT * FROM airports WHERE state = 'California'
SELECT * FROM airports
SELECT * FROM flights WHERE departure_city = 'Oakland' AND arrival_city = 'Salt Lake City' AND date = 'Wednesday' AND time >= 'Night'
SELECT * FROM flights WHERE departure_time < '06:00:00' AND departure_time > '00:00:00' AND departure_day = 'Thursday' AND departure_origin = 'Oakland' AND arrival_city = 'Salt Lake City'
SELECT * FROM airlines WHERE departure_city = 'Toronto' AND arrival_city = 'San Diego'
SELECT * FROM flights WHERE departure_city = 'St. Petersburg' AND arrival_city = 'Charlotte'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is tpa [Answer]: ``` SELECT * FROM table_name WHERE condition
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from cleveland to dallas [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Cleveland' AND arrival_city = 'Dallas'
SELECT * FROM flights WHERE departure_time < '12:00:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what type of aircraft are flying from cleveland to dallas before noon [Answer]: ``` SELECT aircraft_type FROM aircraft WHERE departure_city = 'Cleveland' AND arrival_city = 'Dallas' AND departure_time < '12:00:00'
SELECT * FROM flights WHERE departure_city = 'Indianapolis' AND destination_city = 'Seattle'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND destination_city = 'Seattle'
SELECT * FROM flights WHERE departure_city = 'Nashville' AND destination_city = 'Seattle'
SELECT * FROM flights WHERE departure_city = 'Nashville, TN' AND destination_city = 'Seattle, WA'
SELECT * FROM flights WHERE origin = 'MILW' AND destination = 'TAMPA'
SELECT * FROM rental WHERE city = 'tampa'
SELECT * FROM flights WHERE departure_city = 'St. Louis' AND arrival_city = 'Milwaukee'
SELECT * FROM flights WHERE departure_city = 'Oakland' AND arrival_city = 'Salt Lake City'
SELECT * FROM flights WHERE departure_city = 'Toronto' AND destination_city = 'San Diego'
SELECT * FROM flights WHERE departure_city = 'Toronto' AND destination_city = 'San Diego'
SELECT * FROM flights WHERE origin = 'Toronto' AND destination = 'San Diego'
SELECT * FROM flights WHERE departure_city = 'St. Petersburg' AND arrival_city = 'Charlotte'
SELECT flight_number FROM flights WHERE departure_city = 'Cleveland' AND arrival_city = 'Dallas'
SELECT * FROM flights WHERE departure_city = 'New York' AND arrival_city = 'Miami'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code qo mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%qo%'
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND arrival_city = 'Orlando'
SELECT abbreviation FROM words WHERE word = 'us'
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND arrival_city = 'Orlando'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code f mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%f%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code h mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%code%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code y mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%y%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are restrictions ap/57 [Answer]: ``` SELECT * FROM table_name WHERE column_name = 'ap/57'
SELECT * FROM flights WHERE departure_city = 'Indianapolis' AND departure_time < '10:00:00' AND arrival_city = 'Memphis'
SELECT * FROM flights WHERE departure_city = 'Burbank' AND arrival_city = 'Seattle' AND arrival_time <= '19:00'
SELECT * FROM flights WHERE departure_city = 'Orlando' AND arrival_city = 'Montreal'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is dl [Answer]: ``` SELECT airline FROM airlines WHERE airline_id = dl
SELECT * FROM flights WHERE departure_city = 'Montreal' AND destination_city = 'Orlando'
SELECT * FROM flights WHERE departure_city = 'Orlando' AND destination_city = 'Montreal'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: which airline is kw [Answer]: ``` SELECT airline FROM airlines WHERE airline_name = 'kw'
SELECT * FROM flights WHERE departure_city = 'New York' AND destination_city = 'Miami' OR departure_city = 'Miami' AND destination_city = 'New York'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code bh mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%bh%'
SELECT * FROM flights WHERE departure_city = 'MIA' AND arrival_city = 'JFK'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code bh mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%bh%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code bh mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%bh%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code bh mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%bh%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code bh mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%bh%'
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND departure_time >= '18:00' AND departure_day = 'Wednesday' AND arrival_city = 'Orlando'
SELECT * FROM flights WHERE departure_city = 'Indianapolis' AND destination_city = 'Memphis'
SELECT * FROM flights WHERE departure_city = 'Burbank' AND arrival_city = 'Seattle'
SELECT * FROM flights WHERE departure_city = 'Orlando' AND arrival_city = 'Montreal'
SELECT * FROM flights WHERE departure_city = 'Montreal' AND arrival_city = 'Orlando'
SELECT * FROM flights WHERE departure_city = 'Montreal' AND arrival_city = 'Orlando'
SELECT * FROM flights WHERE departure_city = 'Montreal' AND arrival_city = 'Orlando'
SELECT * FROM flights WHERE departure_city = 'Montreal' AND arrival_city = 'Orlando' ORDER BY price ASC
SELECT * FROM flights WHERE departure_city = 'Orlando' AND arrival_city = 'Montreal' ORDER BY price ASC
SELECT * FROM cities WHERE city_name = 'Kansas City' AND city_name = 'Las Vegas'
SELECT * FROM cities WHERE city_name = 'Kansas City' AND city_name = 'Las Vegas'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is hp [Answer]: ``` SELECT airline FROM airlines WHERE airline_name = 'HP'
SELECT * FROM transportation_data WHERE location = 'Las Vegas'
SELECT * FROM transportation_data WHERE location = 'Las Vegas'
SELECT * FROM cities WHERE city_name = 'Las Vegas' AND city_name = 'Baltimore'
SELECT * FROM cities WHERE city_name = 'Las Vegas' AND city_name = 'Baltimore'
SELECT * FROM economic_data WHERE location IN ('Baltimore', 'Kansas City')
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is us [Answer]: ``` SELECT airline FROM airlines WHERE airline LIKE '%us%'
SELECT airline_name FROM airlines WHERE airline_name = 'us'
SELECT airline_name FROM airlines WHERE airline_name = 'us'
SELECT airline_name FROM airlines WHERE airline_name = 'us'
SELECT airline_name FROM airlines WHERE airline_name = 'us'
INSERT INTO flights (origin, destination, departure_time) VALUES ('Columbus', 'Chicago', '2023-10-20 09:00:00')
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is hp [Answer]: ``` SELECT airline FROM airlines WHERE airline_name = 'HP'
SELECT * FROM cities WHERE city_name = 'St Petersburg' OR city_name = 'Detroit'
SELECT CURDATE() + INTERVAL '5 PM' DAY FROM INTERVAL '2023-10-27' DAY
SELECT * FROM flights WHERE departure_time BETWEEN '09:00:00' AND '10:00:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is yx [Answer]: ``` SELECT airline FROM airlines WHERE airline_id = (SELECT airline_id FROM flights WHERE flight_date = '2023-10-27')
SELECT * FROM flights WHERE departure_city = 'San Jose' AND destination_city = 'Phoenix'
SELECT * FROM flights WHERE departure_city = 'San Jose' AND destination_city = 'Phoenix'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is hp [Answer]: ``` SELECT airline FROM airlines WHERE airline_name = 'HP'
SELECT * FROM transportation WHERE type = 'ground' AND location = 'phoenix'
SELECT * FROM flights WHERE origin = 'PHOENIX' AND destination = 'FORT_WORTH'
SELECT * FROM transportation WHERE location = 'Fort Worth'
SELECT * FROM flights WHERE departure_city = 'Fort Worth' AND arrival_city = 'San Jose'
SELECT * FROM flights WHERE departure_city = 'New York' AND arrival_city = 'Miami' AND trip_date BETWEEN '2023-10-27' AND '2023-10-30'
SELECT * FROM flights WHERE departure_city = 'New York' AND arrival_city = 'Miami' AND trip_date BETWEEN '2023-10-27' AND '2023-10-30'
SELECT * FROM flights WHERE departure_city = 'New York' AND arrival_city = 'Miami' AND duration = 0
SELECT * FROM flights WHERE departure_city = 'MIA' AND arrival_city = 'NYC' AND duration = 0
SELECT * FROM flights WHERE departure_city = 'Indianapolis' AND departure_time < '10:00:00' AND arrival_city = 'Memphis'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code f mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%f%'
SELECT * FROM flights WHERE departure_city = 'Burbank' AND arrival_city = 'Tacoma'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does the restriction ap58 mean [Answer]: The restriction ap58 means "the value of column ap58 must be equal to a specific value". ``` SELECT * FROM table_name WHERE ap58 = 'specific_value'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code h mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%code%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is as [Answer]: ``` SELECT airline_name FROM airlines WHERE airline_name LIKE '%as%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is as [Answer]: ``` SELECT airline_name FROM airlines WHERE airline_name LIKE '%as%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is as [Answer]: ``` SELECT airline_name FROM airlines WHERE airline_name LIKE '%as%'
SELECT airline FROM airlines WHERE airline LIKE '%s%'
SELECT * FROM flights WHERE departure_city = 'St. Petersburg' AND arrival_city = 'Toronto'
SELECT * FROM flights WHERE departure_city = 'Toronto' AND arrival_city = 'St. Petersburg'
SELECT * FROM flights WHERE departure_city = 'Toronto' AND arrival_city = 'St. Petersburg'
SELECT * FROM flights WHERE departure_city = 'Toronto' AND arrival_city = 'St. Petersburg'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is hp [Answer]: ``` SELECT airline FROM airlines WHERE airline_name = 'HP'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND destination_city = 'San Diego'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND destination_city = 'San Diego'
SELECT * FROM flights WHERE departure_city = 'Kansas City' AND destination_city = 'Denver'
SELECT * FROM flights WHERE departure_city = 'Denver' AND arrival_city = 'Phoenix'
SELECT * FROM flights WHERE departure_city = 'Phoenix' AND destination_city = 'Las Vegas'
SELECT * FROM flights WHERE departure_city = 'LAS' AND arrival_city = 'SAN'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND departure_time >= '09:00:00' AND arrival_city = 'Kansas City'
SELECT * FROM flights WHERE departure_city = 'Houston' AND destination_city = 'San Jose'
SELECT * FROM flights WHERE departure_city = 'Houston' AND destination_city = 'Milwaukee'
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND destination_city = 'San Jose' AND departure_date = 'Wednesday'
SELECT * FROM flights WHERE departure_city = 'San Jose' AND destination_city = 'Dallas' AND day = 'Friday'
SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Houston'
SELECT dst, distance FROM airports WHERE airport_name = 'JFK' AND distance < 5000
SELECT DISTINCT airport_name FROM airports WHERE city = 'New York'
SELECT DISTINCT airport_name FROM airports WHERE city = 'New York'
SELECT DISTINCT airport_name FROM airports WHERE airport_city = 'LA'
SELECT * FROM airports
SELECT DISTINCT airport_name FROM airports WHERE airport_city = 'LA'
SELECT DISTINCT airport_name FROM airports WHERE airport_city = 'LA'
SELECT DISTINCT airport_name FROM airports WHERE airport_city = 'LA'
SELECT * FROM table_name WHERE column_name = 'value'
SELECT * FROM table_name WHERE column_name = 'value'
SELECT * FROM flights WHERE departure_city = 'New York' AND arrival_city = 'Los Angeles'
SELECT * FROM flights WHERE departure_airport = 'LA guardia' AND arrival_airport = 'Burbank'
SELECT * FROM flights WHERE departure_city = 'LA' AND arrival_city = 'ORD'
SELECT * FROM flights WHERE departure_city = 'Ontario, California' AND arrival_city = 'Orlando'
SELECT * FROM flights WHERE departure_city = 'Ontario, California' AND arrival_city = 'Orlando'
SELECT * FROM flights WHERE departure_city = 'Indianapolis' AND arrival_city = 'Memphis' AND day = 'Monday'
SELECT * FROM flights WHERE departure_city = 'Indianapolis' AND arrival_city = 'Memphis' AND departure_date = '2023-10-27' AND departure_time = '10:00 AM'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND arrival_city = 'Miami' AND departure_date = 'Wednesday'
SELECT * FROM flights WHERE departure_city = 'MIA' AND arrival_city = 'IND' AND day = 'SUNDAY'
SELECT * FROM flights WHERE departure_city = 'Charlotte' AND departure_date = 'Saturday' AND departure_time BETWEEN '12:00 PM' AND '5:00 PM'
SELECT aircraft_type FROM flights WHERE departure_city = 'Charlotte'
SELECT class_name FROM classes WHERE class_code = 'farecodeq'
SELECT * FROM flights WHERE departure_city = 'Orlando' AND departure_date = 'Saturday' AND fare_basis = 'Q'
SELECT * FROM airfares WHERE departure_city = 'Detroit' AND arrival_city = 'St. Petersburg'
SELECT * FROM flights WHERE departure_city = 'Detroit' AND arrival_city = 'St. Petersburg'
SELECT * FROM flights WHERE departure_city = 'PIT' AND departure_date = 'MONDAY' AND departure_time = '09:00'
SELECT * FROM flights WHERE departure_city = 'Minneapolis' AND arrival_city = 'Pittsburgh' AND departure_date = 'Friday'
SELECT * FROM flights WHERE departure_time < '9:00:00'
SELECT * FROM flights WHERE departure_city = 'Cincinnati' AND departure_time < '12:00:00'
SELECT * FROM flights WHERE departure_time >= '15:00:00' AND departure_time < '18:00:00' AND destination = 'Cincinnati'
SELECT * FROM airlines WHERE departure_city = 'SEATTLE' AND arrival_city = 'SLC'
SELECT * FROM flights WHERE departure_city = 'SEA' AND arrival_city = 'SLC' AND departure_date BETWEEN '2023-03-01' AND '2023-03-31'
SELECT seating_capacities FROM flights WHERE origin = 'SEA' AND destination = 'SLC'
SELECT * FROM flights WHERE departure_city = 'SEA' AND arrival_city = 'SLC' AND aircraft_type = 'DC-8'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what ground transportation is there in baltimore [Answer]: - Amtrak - Greyhound - Metrobus - MTA
SELECT * FROM transportation WHERE location = 'Baltimore' ORDER BY type
SELECT * FROM flights WHERE departure_city = 'Baltimore' AND destination_city = 'San Francisco' AND day = 'Friday'
SELECT * FROM flights WHERE departure_city = 'Los Angeles' AND destination_city = 'Pittsburgh' AND departure_date = 'Tuesday'
SELECT * FROM flights WHERE departure_city = 'PIT' AND destination_city = 'LAX' AND departure_date = '2023-10-27' AND departure_time = '20:00:00'
SELECT * FROM flights WHERE departure_city = 'Cleveland' AND arrival_city = 'Miami' AND departure_date = DATE_ADD(next_day(), 1, CURRENT_DATE) AND departure_date BETWEEN DATE_ADD(current_date, INTERVAL 7 DAY) AND current_date + INTERVAL 1 DAY
SELECT fares FROM flights WHERE departure_city = 'CLE' AND arrival_city = 'MIA' AND departure_date = '2023-10-25' AND departure_time = '18:00' AND arrival_date = '2023-10-25' AND day = 'Wednesday'
SELECT * FROM flights WHERE departure_city = 'MIA' AND destination_city = 'CLE' AND date = '2023-10-27'
SELECT fares FROM fares WHERE departure_city = 'Miami' AND arrival_city = 'Cleveland' AND departure_date = DATE_ADD(NOW(), INTERVAL 1 DAY) AND arrival_date = DATE_ADD(NOW(), INTERVAL 1 DAY)
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND departure_date = 'Saturday' OR departure_date = 'Sunday' AND airline_name = 'American Airlines'
SELECT * FROM flights WHERE departure_city = 'Phoenix' AND destination_city = 'Milwaukee' AND day = 'Wednesday' AND time = 'Evening'
SELECT * FROM flights WHERE departure_city = 'Phoenix' AND destination_city = 'Milwaukee' AND departure_date = 'Wednesday' AND airline_name = 'American Airlines'
SELECT * FROM flights WHERE departure_airport = 'PHOENIX' AND arrival_airport = 'MILWAUKEE' AND airline_name = 'AMERICAN AIRLINES'
SELECT * FROM flights WHERE origin = 'PHOENIX' AND destination = 'MILWAUKEE'
SELECT * FROM flights WHERE departure_time = 'Saturday 8:00 AM' AND departure_origin = 'Chicago' AND arrival_destination = 'Seattle'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND departure_date = 'Saturday' AND meal_available = 'Yes'
SELECT * FROM flights WHERE departure_city = 'SEA' AND arrival_city = 'CHI' AND meal_type = 'Continental'
SELECT * FROM flights WHERE departure_city = 'SEA' AND departure_date = '2023-06-01' AND flight_type = 'Continental' AND meal = 'Continental'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND departure_date = 'Saturday' AND carrier = 'Continental' AND meal_time = 'Early' AND day = 'Saturday'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND departure_date = 'Saturday' AND arrival_city = 'Seattle' AND meal_time = 'Early'
SELECT * FROM flights WHERE date = '2023-06-07' AND origin = 'CHI' AND destination = 'MIN'
SELECT * FROM flights WHERE date = '2023-06-07' AND airline = 'Continental' AND departure_city = 'Chicago' AND arrival_city = 'Minneapolis'
SELECT * FROM flights WHERE departure_date = '2023-06-07' AND departure_time BETWEEN '08:00:00' AND '12:00:00' AND airline = 'Continental' AND meal = 'Yes'
SELECT * FROM flights WHERE departure_city = 'New York' AND destination_city = 'Las Vegas' AND flight_duration = 0
SELECT * FROM flights WHERE departure_city = 'MEM' AND arrival_city = 'LAS' AND flight_duration = 0
SELECT * FROM flights WHERE date = '2023-05-23' AND origin = 'Newark' AND destination = 'Tampa'
SELECT * FROM flights WHERE date = 'Sunday' AND origin = 'Tampa' AND destination = 'Charlotte'
SELECT * FROM flights WHERE departure_city = 'Charlotte' AND departure_date = 'Tuesday' AND arrival_city = 'Baltimore'
SELECT * FROM flights WHERE departure_city = 'Baltimore' AND arrival_city = 'Newark'
SELECT flight_number FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Houston'
SELECT flight_number FROM flights WHERE departure_city = 'Houston' AND arrival_city = 'Dallas'
SELECT * FROM flights WHERE departure_airport = 'MIL' AND arrival_airport = 'PHO' AND date = '2023-10-27'
SELECT flight_number FROM american_airlines WHERE departure_city = 'Phoenix' AND arrival_city = 'Milwaukee'
SELECT flight_number FROM flights WHERE departure_city = 'Chicago' AND arrival_city = 'Seattle'
SELECT flight_number FROM flights WHERE departure_city = 'Chicago' AND destination_city = 'Seattle' AND flight_date BETWEEN '2023-03-01' AND '2023-03-31'
SELECT flight_number FROM flights WHERE departure_city = 'Seattle' AND destination_city = 'Chicago' AND flight_date BETWEEN '2023-01-01' AND '2023-12-31'
SELECT * FROM fares WHERE departure_city = 'Pittsburgh' AND arrival_city = 'Cleveland' AND fare < 200
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how much is coach flight from pittsburgh to atlanta [Answer]: 300 USD ``` SELECT price FROM flights WHERE origin = 'PIT' AND destination = 'ATL' AND date >= '2023-10-27' AND date <= '2023-10-30'
SELECT * FROM flights WHERE departure_city = 'Newark' AND departure_date = 'Friday'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: tampa to charlotte sunday morning [Answer]: 2023-07-27 08:00:00 UTC
SELECT CURDATE() + INTERVAL '2023-10-26 14:00:00 UTC' DAY
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: baltimore to newark wednesday morning [Answer]: 2023-10-26 09:00:00 UTC
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: dallas to houston after 1201am [Answer]: 2023-10-26 12:01:00 UTC
SELECT * FROM trips WHERE departure_time < '00:00:00' AND departure_time > '18:00:00'
SELECT TO_DATE(CONCAT(YEAR(2023), '-12-', EXTRACT(DAY FROM TO_DATE('2023-12-27', 'YYYY-MM-DD')), 'YYYY-MM-DD HH24:MI:SS UTC')
SELECT * FROM flights WHERE departure_time BETWEEN '2023-10-27 12:00:00' AND '2023-10-27 16:00:00' AND departure_city = 'Cleveland' AND arrival_city = 'Miami'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: miami to cleveland sunday afternoon [Answer]: 2023-10-27 19:00:00 UTC
SELECT * FROM flights WHERE departure_city = 'New York City' AND arrival_city = 'Las Vegas' AND departure_date = 'Sunday' AND arrival_date = 'Sunday'
SELECT * FROM flights WHERE departure_city = 'New York City' AND arrival_city = 'Las Vegas' AND departure_date = 'Sunday' AND arrival_date = 'Sunday'
SELECT CURDATE() + INTERVAL '1 day' + INTERVAL '7 hours' FROM NULL
SELECT * FROM events WHERE city = 'Memphis' AND event_date = '2023-10-27' AND event_time BETWEEN '19:00:00' AND '19:00:00'
SELECT * FROM flights WHERE departure_city = 'New York' AND departure_date = 'Sunday' AND arrival_city = 'Las Vegas'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: chicago to seattle saturday morning [Answer]: 2023-03-19 09:00:00 UTC
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: chicago to las vegas saturday morning [Answer]: 2023-06-14 09:00:00 UTC
SELECT * FROM flights WHERE departure_city = 'Pittsburgh' AND arrival_city = 'Los Angeles' AND departure_date = 'Thursday' AND arrival_date = 'Thursday'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: milwaukee to phoenix on saturday [Answer]: 2023-10-27 12:00:00 UTC
SELECT DATE_FORMAT(MAX(timestamp), '%Y-%m-%d %H:%i:%s UTC') FROM events WHERE event_type = 'phoenix' AND event_date = 'sunday' AND event_time >= '12:00:00' AND event_time < '18:00:00'
SELECT DATE_FORMAT(event_time, '%Y-%m-%d %H:%i:%s UTC') FROM events WHERE event_location = 'phoenix' AND event_date = 'wednesday' AND event_time >= '2023-10-22 12:00:00 UTC'
SELECT * FROM flights WHERE departure_time BETWEEN '5:00 PM' AND '8:00 PM'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how many northwest flights leave st. paul [Answer]: 5 SELECT COUNT(*) FROM flights WHERE departure_city = 'St. Paul'<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how many northwest flights leave washington dc [Answer]: 5 SELECT COUNT(*) FROM flights WHERE departure_city = 'Washington Dulles International Airport' AND direction = 'Northwest'<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how many flights does northwest have leaving dulles [Answer]: 12 ``` SELECT COUNT(*) FROM flights WHERE departure_airport = 'DU' AND date >= '2023-01-01' AND date <= '2023-12-31'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what cities does northwest fly out of [Answer]: - Chicago - Denver - Minneapolis
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: list the cities from which northwest flies [Answer]: ``` SELECT city FROM airlines WHERE region = 'North America' AND city NOT IN ( SELECT city FROM airlines WHERE region = 'North America' AND city IS NULL )
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what cities does northwest fly to [Answer]: - Chicago - Minneapolis - Seattle
SELECT * FROM flights WHERE departure_time >= '16:00'
SELECT * FROM flights WHERE departure_city = 'Dallas' AND destination_city = 'San Francisco'
SELECT * FROM flights WHERE departure_airport = 'PHL' AND destination_airport = 'DAL' AND departure_date >= '2023-04-01' AND departure_date <= '2023-04-30'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND destination_city = 'Dallas'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is a d9s [Answer]: 24 SELECT * FROM table_name WHERE column_name = 'd9s'<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what type of plane is a d9s [Answer]: 747 SELECT type FROM aircraft WHERE aircraft_id = 747<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is a d9s [Answer]: 24 SELECT * FROM table_name WHERE column_name = 'd9s'<eos
SELECT airport_name FROM airports WHERE tower_air = 'YES'
SELECT flight_id, airline, departure_city, arrival_city, departure_date, arrival_date FROM flights WHERE departure_city = 'JFK' AND arrival_city = 'ORD'
SELECT flight_id, airline, departure_city, arrival_city FROM flights WHERE departure_city = 'Kennedy Airport' AND arrival_city = 'Miami'
SELECT * FROM flights WHERE departure_airport = 'JFK' AND destination_airport = 'MIA'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: are meals ever served on tower air [Answer]: ``` SELECT * FROM meals WHERE meal_type = 'Tower Air'
SELECT * FROM menu WHERE category = 'snacks' AND air = 'tower'
SELECT * FROM flights WHERE departure_airport = 'JFK' AND arrival_airport = 'MIA'
SELECT * FROM flights WHERE departure_city = 'BOS' AND destination_city = 'SLC'
SELECT * FROM flights WHERE departure_city = 'BOS' AND arrival_city = 'SLC'
SELECT * FROM flights WHERE departure_city = 'BOS' AND arrival_city = 'SLC' AND departure_date BETWEEN '2023-03-01' AND '2023-03-31'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the fares for flights between boston and washington dc [Answer]: ``` SELECT fare_amount FROM flights WHERE origin = 'BOS' AND destination = 'DCA'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the least expensive fare from boston to salt lake city [Answer]: 299 ``` SELECT MIN(fare) FROM routes WHERE origin = 'Boston' AND destination = 'Salt Lake City'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the lowest fares from washington dc to salt lake city [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Washington, DC' AND arrival_city = 'Salt Lake City'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the lowest fare from bwi to salt lake city [Answer]: 249.99 ``` SELECT MIN(fare) FROM routes WHERE origin = 'BWI' AND destination = 'SLC'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: show me the cost of a first class ticket from detroit to las vegas and back [Answer]: 349.99 ``` SELECT cost FROM flights WHERE origin = 'DET' AND destination = 'LAS' AND class = 'FIRST CLASS'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the earliest arriving flight from boston to washington dc [Answer]: 08:00 SELECT * FROM flights WHERE departure_time = '08:00'<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the earliest arriving flight between boston and washington dc [Answer]: 08:00 AM SELECT * FROM flights WHERE departure_time = '08:00 AM'<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what's the earliest arriving flight between boston and washington dc [Answer]: 08:00 AM SELECT * FROM flights WHERE departure_time = '08:00 AM'<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the earliest arriving flight from houston to orlando [Answer]: 08:00 SELECT * FROM flights WHERE departure_time = '08:00'<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the earliest arriving flight from houston to orlando [Answer]: 08:00 SELECT * FROM flights WHERE departure_time = '08:00'<eos
SELECT * FROM flights WHERE departure_city = 'Houston' AND arrival_city = 'Orlando'
SELECT * FROM flights WHERE departure_city = 'Houston' AND arrival_city = 'Orlando'
SELECT * FROM flights WHERE departure_city = 'Houston' AND destination_city = 'Orlando'
SELECT * FROM flights WHERE departure_time BETWEEN '2023-04-01 8:00:00' AND '2023-04-01 9:00:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the seating capacity on the aircraft 733 [Answer]: 84 passengers.<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the seating capacity of a 72s [Answer]: 120 ``` SELECT seating_capacity FROM seating_capacity WHERE seating_capacity = 72s
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the seating capacity of the aircraft 72s [Answer]: 172 seats.<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the seating capacity of the aircraft m80 [Answer]: 234
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the seating capacity of the type of aircraft m80 [Answer]: 250
SELECT seating_capacity FROM m80
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airlines serve denver [Answer]: ``` SELECT DISTINCT airline_name FROM airlines WHERE airport_city = 'Denver'
SELECT * FROM airlines WHERE departures_from = 'DENVER' OR arrivals_to = 'DENVER'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airlines fly into denver [Answer]: ``` SELECT * FROM airlines WHERE destination = 'Denver'
SELECT * FROM flights WHERE departure_time BETWEEN '8:00 PM' AND '9:00 PM'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the capacity of the 73s [Answer]: 128GB SELECT capacity FROM devices WHERE device_type = '73s'<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is 73s [Answer]: 73 ``` SELECT * FROM table_name WHERE column_name = 73s
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is seating capacity on the aircraft 73s [Answer]: 84 passengers.<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the seating capacity of a 757 [Answer]: 84 passengers.<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how many people will a 757 hold [Answer]: 5 SELECT COUNT(*) FROM table_name WHERE column_name = 757<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how many passengers can fly on a 757 [Answer]: 450 ``` SELECT COUNT(*) FROM passengers WHERE aircraft_type = '757'
SELECT flight_date, flight_time FROM flights WHERE flight_time BETWEEN '8:00:00' AND '21:00:00'
SELECT * FROM flights WHERE departure_time BETWEEN '8:00:00' AND '9:00:00'
SELECT * FROM flights WHERE departure_time BETWEEN '2023-08-27 19:00:00' AND '2023-08-27 20:00:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the seating capacity of the 757 [Answer]: 84 passengers.<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: tell me about the m80 aircraft [Answer]: The m80 aircraft is a twin-engine military aircraft developed by McDonnell Douglas. It is a versatile aircraft capable of performing various missions, including air combat, electronic warfare, and intelligence gathering. The m80 is known for its powerful engines, advanced avionics, and long-range capabilities. ``` SELECT * FROM aircraft WHERE type = 'm80'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: tell me about the m80 aircraft [Answer]: The m80 aircraft is a twin-engine military aircraft developed by McDonnell Douglas. It is a versatile aircraft capable of performing various missions, including air combat, electronic warfare, and intelligence gathering. The m80 is known for its powerful engines, advanced avionics, and long-range capabilities. ``` SELECT * FROM aircraft WHERE type = 'm80'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: tell me about the type of aircraft called an m80 [Answer]: The m80 is a twin-engine military aircraft developed by McDonnell Douglas. It is a versatile aircraft capable of carrying up to 50 passengers and 1,000 pounds of cargo. The m80 is known for its powerful engines, advanced avionics, and long range.<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the seating capacity of the 733 [Answer]: 72 SELECT seating_capacity FROM seating WHERE seating_number = 733<eos
SELECT seating_capacity FROM m80
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the seating capacity on the aircraft m80 [Answer]: 150 seats.<eos
SELECT * FROM flights WHERE departure_time BETWEEN '8:00:00' AND '21:00:00'
SELECT * FROM flights WHERE departure_time BETWEEN '8:00 PM' AND '9:00 PM'
SELECT * FROM flights WHERE departure_time BETWEEN '8:00:00' AND '21:00:00' AND aircraft_type IN ('Airbus', 'Boeing', 'DC-3')
SELECT * FROM flights WHERE departure_city = 'Nashville' AND departure_date = 'Monday' AND departure_time = '09:00'
SELECT * FROM flights WHERE departure_city = 'Nashville' AND departure_date = 'Monday' AND departure_time = '09:00'
SELECT * FROM flights WHERE departure_time >= '8:42 AM'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND departure_date = 'Monday' AND arrival_city = 'New York City'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is cvg [Answer]: ``` SELECT * FROM cvg
SELECT DISTINCT transportation_provider FROM locations WHERE departure_airport = 'LaGuardia Airport' AND destination_city = 'New York City'
SELECT * FROM transportation WHERE origin = 'LGA' AND destination = 'NYC'
SELECT * FROM transportation WHERE origin = 'LGA' AND destination = 'NYC'
SELECT * FROM ground_transportation WHERE origin = 'ewr' AND destination = 'new_york_city'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND departure_date >= '2023-04-01' AND departure_date <= '2023-04-30'
SELECT * FROM flights WHERE departure_city = 'New York City' AND departure_time >= '17:00' AND departure_day = 'Wednesday'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: tell me about the ground transportation from nashville airport [Answer]: The ground transportation from Nashville Airport consists of the following options: - Greyhound buses - Uber/Lyft - Taxis - Ride-sharing services ``` SELECT DISTINCT transportation_options FROM transportation WHERE transportation_type = 'ground'
SELECT * FROM flights WHERE departure_time BETWEEN '12:00 PM' AND '19:00 PM' AND arrival_time BETWEEN '07:00 AM' AND '23:00 PM'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how many flights does alaska airlines have to burbank [Answer]: 12 ``` SELECT COUNT(*) FROM flights WHERE departure_airport = 'ALPA' AND destination_airport = 'BURK'
SELECT * FROM flights WHERE departure_airport = 'BUR' AND destination_airport IN ('ANYWHERE')
SELECT * FROM flights WHERE departure_city = 'Burbank'
SELECT airline_name FROM airlines WHERE airline_name LIKE '%{query}%'
SELECT flight_id, airline, arrival_time FROM flights WHERE departure_airport = 'BUR' AND arrival_time >= '2023-10-27 10:00:00' AND arrival_time <= '2023-10-27 20:00:00'
SELECT * FROM flights WHERE departure_city = 'Burbank'
SELECT * FROM flights WHERE airline_name = 'Alaska Airlines'
SELECT * FROM flights WHERE departure_city = 'Seattle'
SELECT * FROM flights WHERE departure_time < '12:00:00'
SELECT * FROM fares WHERE origin = 'Charlotte' AND destination = 'Las Vegas' ORDER BY fare ASC
SELECT * FROM flights WHERE departure_time >= '06:00' AND departure_time < '10:00' AND origin = 'LAX' AND destination = 'CLT'
SELECT * FROM flights WHERE departure_city = 'Charlotte' AND arrival_city = 'Newark'
SELECT * FROM flights WHERE departure_city = 'Newark' AND arrival_city = 'Los Angeles'
SELECT * FROM flights WHERE departure_city = 'Newark' AND arrival_city = 'Los Angeles' AND date >= DATEADD(day, -1, GETDATE())
SELECT * FROM flights WHERE departure_date = 'Sunday' AND origin = 'Montreal, QC' AND destination = 'San Diego, CA'
SELECT * FROM flights WHERE date = 'tuesday' AND departure_city = 'San Diego' AND arrival_city = 'Indianapolis'
SELECT * FROM trips WHERE departure_date = '2023-04-14' AND departure_time = '09:00:00' AND arrival_city = 'Toronto'
SELECT * FROM flights WHERE date = '2023-05-05' AND time = '09:00'
SELECT * FROM flights WHERE origin = 'CIN' AND destination = 'BUR'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what type of aircraft is used for the american flight leaving at 419pm [Answer]: 737 SELECT aircraft_type FROM aircraft WHERE flight_time = 419<eos
SELECT * FROM flights WHERE departure_city = 'Kansas City' AND departure_date = DATE_ADD(next_day(), INTERVAL 1 DAY)
SELECT flight_id, origin, destination FROM flights WHERE origin IN ('Long Beach', 'St. Louis')
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from memphis to las vegas [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'MEM' AND arrival_city = 'LAS'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from las vegas to ontario [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'LAS' AND arrival_city = 'ONT'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from ontario to memphis [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Ontario' AND arrival_city = 'Memphis'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what type of ground transportation is there at the las vegas airport [Answer]: - Airport shuttles - Public transportation - Ridesharing services
SELECT * FROM taxis WHERE location = 'Ontario Airport'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from tampa to milwaukee [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'TAMPA' AND arrival_city = 'MILWAUKEE'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from milwaukee to seattle [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND arrival_city = 'Seattle'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from la guardia to san jose on united [Answer]: ``` SELECT * FROM flights WHERE departure_airport = 'LAguardia' AND arrival_airport = 'SANJose'
SELECT * FROM flights WHERE departure_city = 'Charlotte, NC' AND destination_city = 'Phoenix, AZ' AND day = 'Monday'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from phoenix arizona to st. paul minnesota on tuesday [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Phoenix, Arizona' AND arrival_city = 'St. Paul, Minnesota' AND day = 'Tuesday'
SELECT * FROM flights WHERE departure_date = '2023-10-24' AND departure_airport = 'MSP' AND arrival_airport = 'STL'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from st. louis to charlotte north carolina leaving on friday [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'St. Louis' AND departure_date = 'Friday'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from boston to orlando that stop in new york [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'BOS' AND arrival_city = 'ORD' AND has_stop = 'YES' AND departure_city IN ('BOS', 'JFK') OR arrival_city IN ('BOS', 'JFK')
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: i need a morning flight from burbank to milwaukee on next monday [Answer]: 2023-10-27 07:00:00 UTC **Explanation:** The instruction is asking for a flight departing Burbank to Milwaukee on the next Monday. The instruction also specifies the desired time of departure, which is 7 AM UTC.<eos
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND arrival_city = 'St. Louis' AND departure_time = 'Monday Night'
SELECT * FROM flights WHERE departure_city = 'St. Louis' AND departure_date = 'Tuesday' AND arrival_city = 'Burbank'
SELECT * FROM flights WHERE departure_date = '2023-10-27' AND departure_airport = 'STL' AND arrival_airport = 'BUR'
SELECT * FROM flights WHERE departure_date = '2023-10-27' AND departure_time <= 18:00 AND arrival_date = '2023-10-27' AND arrival_time >= 16:00
SELECT * FROM flights WHERE departure_city = 'Cincinnati' AND departure_date = 'Saturday' AND arrival_airport = 'Newark Airport' AND arrival_time <= 1800
SELECT * FROM flights WHERE departure_city = 'MIA' AND arrival_city = 'CHI' AND arrival_time >= '17:00:00' AND arrival_time <= '19:00:00'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND arrival_city = 'Tacoma' AND has_flight_through_los_angeles = 1
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights between cincinnati and san jose california which leave after 6pm [Answer]: ``` SELECT * FROM flights WHERE departure_time > '18:00:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the nonstop flights between san jose and houston texas [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'San Jose' AND arrival_city = 'Houston, Texas'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the nonstop flights between houston and memphis [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Houston' AND arrival_city = 'Memphis'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights between memphis and cincinnati on wednesday [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'MEMPH' AND arrival_city = 'CINcinnati' AND day = 'WEDNESDAY'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the american flights from newark to nashville [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Newark' AND arrival_city = 'Nashville'
SELECT * FROM flights WHERE departure_city = 'Ontario' AND arrival_city = 'Westchester' AND stops IN ('Chicago')
SELECT * FROM flights WHERE departure_city = 'Los Angeles' AND destination_city = 'Charlotte'
SELECT * FROM flights WHERE departure_city = 'Charlotte' AND arrival_city = 'Newark'
SELECT * FROM flights WHERE departure_city = 'Newark' AND destination_city = 'Los Angeles'
SELECT * FROM flights WHERE departure_city = 'Cincinnati' AND arrival_city = 'Burbank' AND airline = 'American Airlines'
SELECT * FROM flights WHERE departure_city = 'Kansas City' AND destination_city = 'Chicago' AND departure_date = '2023-06-16'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND destination_city = 'Kansas City' AND departure_date = '2023-06-17'
SELECT * FROM flights WHERE departure_city = 'Kansas City' AND destination_city = 'Chicago' AND departure_date = '2023-06-16'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND destination_city = 'Kansas City' AND departure_date = '2023-06-17'
SELECT * FROM trips WHERE origin = 'Burbank' AND destination = 'Milwaukee'
SELECT * FROM flights WHERE departure_city = 'Cincinnati' AND departure_date = 'Saturday' AND arrival_city = 'New York' AND arrival_time <= 1800
SELECT flight_id, departure_city, arrival_city, departure_time FROM flights WHERE departure_city = 'Salt Lake City' AND departure_time < '2023-10-27 18:00:00' AND arrival_city = 'New York'
SELECT * FROM flights WHERE departure_city = 'MIA' AND arrival_city = 'CHI' AND arrival_time >= '17:00' AND airline = 'AMERICAN AIRLINES'
SELECT * FROM trips WHERE departure_city = 'Kansas City' AND departure_date = DATE_ADD(NOW(), INTERVAL 1 WEEK) AND arrival_city = 'Chicago'
SELECT * FROM flights WHERE departure_city = 'Kansas City' AND destination_city = 'Chicago' AND departure_date = '2023-05-26' AND departure_time = '19:00'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND arrival_city = 'Tacoma' AND has_stops = 1 AND stops IN ('Los Angeles')
SELECT * FROM flights WHERE departure_city = 'San Diego' AND arrival_city = 'Phoenix' AND departure_date = 'Monday AM'
SELECT * FROM flights WHERE departure_city = 'Phoenix' AND arrival_city = 'Detroit' AND day = 'Monday'
SELECT * FROM flights WHERE departure_city = 'Detroit' AND destination_city = 'San Diego' AND day = 'Tuesday'
SELECT * FROM flights WHERE departure_city = 'Cincinnati' AND destination_city = 'San Jose' AND day = 'Monday'
SELECT * FROM flights WHERE departure_city = 'San Jose' AND destination_city = 'Houston' AND day = 'Wednesday'
SELECT * FROM flights WHERE departure_city = 'Houston' AND arrival_city = 'Memphis' AND departure_date = 'Friday'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND arrival_city = 'Cincinnati' AND departure_date = 'Sunday'
SELECT * FROM flights WHERE departure_city = 'Newark' AND arrival_city = 'Nashville' AND departure_time BETWEEN 18:00:00 AND 20:00:00
SELECT * FROM flights WHERE departure_city = 'Burbank' AND destination_city = 'Tacoma' AND date = '2023-06-10'
SELECT * FROM flights WHERE departure_city = 'Burbank' AND destination_city = 'Milwaukee'
SELECT * FROM flights WHERE departure_city = 'Burbank' AND destination_city = 'Milwaukee'
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND destination_city = 'St. Louis'
SELECT * FROM flights WHERE departure_city = 'St. Louis' AND destination_city = 'Burbank'
SELECT * FROM airlines WHERE departure_city = 'Burbank' AND arrival_city IN ('Milwaukee', 'St. Louis')
SELECT * FROM flights WHERE departure_city = 'Burbank' AND arrival_city = 'Milwaukee' AND has_stop = 'Yes' AND has_roundtrip = 'Yes'
SELECT * FROM flights WHERE destination = 'Westchester County'
SELECT * FROM flights WHERE departure_city = 'Salt Lake City' AND destination_city = 'Westchester County'
SELECT DISTINCT airport_name FROM airports WHERE airport_city IN ('Westchester', 'Westchester County')
SELECT * FROM flights WHERE departure_city = 'Cincinnati' AND arrival_city = 'New York City' AND departure_date = DATE_ADD(NOW(), INTERVAL 1 DAY) AND airline_name = 'United Airlines'
SELECT DISTINCT airport_name FROM airports WHERE airport_city = 'New York City'
SELECT * FROM flights WHERE departure_city = 'cincinnati' AND departure_date = DATE_ADD(NOW(), INTERVAL 1 DAY) AND arrival_city IN ( SELECT DISTINCT airport FROM airports WHERE airport_city IN ('new york', 'nyc') AND arrival_time <= 1800 ) AND arrival_time > 1200
SELECT * FROM flights WHERE departure_city = 'Cincinnati' AND destination_city IN ( SELECT DISTINCT airport FROM airports WHERE state IN ('New York', 'New Jersey', 'Connecticut') )
SELECT * FROM flights WHERE departure_city = 'MIA' AND arrival_city = 'CHI' AND airline_name = 'American Airlines'
SELECT * FROM flights WHERE departure_city = 'KCLT' AND arrival_city = 'CHI'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND arrival_city = 'Tacoma'
