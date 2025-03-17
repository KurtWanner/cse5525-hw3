os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what flights are available tomorrow from denver to philadelphia [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'DEN' AND arrival_city = 'PHI' AND departure_date = DATE_SUB(NOW(), INTERVAL 1 DAY)
SELECT * FROM flights WHERE departure_city = 'WA' AND arrival_city = 'BO' AND departure_time >= '14:00' AND departure_time <= '17:00'
SELECT * FROM arrivals WHERE airport = 'BALtimore' AND arrival_time < '09:00:00' AND arrival_time >= '08:00:00'
SELECT * FROM flights WHERE origin = 'PHOENIX' AND destination = 'MILWAUKEE'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'San Francisco' AND origin_city = 'Dallas'
SELECT * FROM cities WHERE city_name = 'Denver'
SELECT flight_id, origin, destination, departure_time, arrival_time FROM flights WHERE origin = 'BOS' AND destination = 'SFO' AND departure_time BETWEEN '2023-10-27' AND '2023-10-29'
SELECT * FROM cities WHERE city = 'atlanta'
SELECT * FROM flights WHERE departure_city = 'BAL' AND destination_city = 'ATL'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what flights are there from newark to tampa [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Newark' AND destination_city = 'Tampa'
SELECT * FROM flights WHERE departure_city = 'ATL' AND arrival_city = 'BAL'
SELECT * FROM flights WHERE departure_city = 'Dallas' AND destination_city = 'Boston'
SELECT * FROM flights WHERE departure_city = 'Houston' AND departure_date = 'Friday' AND airline = 'American Airlines'
SELECT * FROM flights WHERE departure_city = 'BOS' AND destination_city = 'DEN'
SELECT * FROM flights WHERE departure_city = 'Denver' AND arrival_city = 'Philadelphia'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the earliest flight leaving denver going to boston [Answer]: 2023-10-27 12:00 PM ``` SELECT * FROM flights WHERE departure_city = 'Denver' AND departure_time = '2023-10-27 12:00 PM'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND destination_city = 'Boston' AND departure_date = '2023-08-08'
SELECT * FROM flights WHERE departure_city = 'Oakland' AND arrival_city = 'Philadelphia' AND departure_time = '17:00' AND arrival_time = '19:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what's the lowest round trip fare from dallas to any city [Answer]: ``` SELECT MIN(roundtrip_fare) FROM flights WHERE departure_city = 'Dallas' AND arrival_city IN ( SELECT DISTINCT arrival_city FROM flights WHERE departure_city = 'Dallas' )
SELECT flight_time FROM flights WHERE departure_city = 'Boston' AND departure_time < '8:00:00' AND arrival_city = 'Baltimore'
SELECT flight_id, count(stop) AS num_stops FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'San Francisco' AND num_stops = ( SELECT MAX(num_stops) FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'San Francisco' )
SELECT flight_id, origin, destination FROM flights WHERE origin = 'PHL' AND destination = 'DAL'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'Baltimore' AND departure_time >= '16:00:00' AND departure_time <= '17:00:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights and prices from la to charlotte for monday morning [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'LA' AND departure_date = '2023-10-27' AND flight_time = '09:00'
SELECT * FROM flights WHERE departure_city = 'PIT' AND arrival_city = 'BAL' AND departure_time <= '10:00:00' AND departure_day = 'THURSDAY'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights available between 10am and 3pm between pittsburgh and fort worth [Answer]: ``` SELECT * FROM flights WHERE departure_time BETWEEN '10:00:00' AND '13:00:00' AND origin = 'PIT' AND destination = 'FTW'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from dallas to philadelphia [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Philadelphia'
SELECT flight_id, origin, destination, departure_time, arrival_time FROM flights WHERE origin = 'SFO' AND destination = 'PIT' AND departure_date = '2023-10-27' AND departure_time = '19:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the cost of united airlines flight 415 from chicago to kansas city thursday night [Answer]: 275 USD ``` SELECT cost FROM flights WHERE flight_number = 415 AND departure_city = 'CHICAGO' AND destination_city = 'KANSAS CITY' AND day = 'THURSDAY' AND time = 'NIGHT'
SELECT * FROM flights WHERE departure_city = 'BOS' AND destination_city = 'SFO' AND stops IN ('DAL')
SELECT * FROM flights WHERE departure_time BETWEEN '07:00' AND '10:00' AND departure_city = 'Philadelphia' AND arrival_city = 'Pittsburgh'
SELECT * FROM flights WHERE departure_city = 'PIT' AND arrival_city = 'PHI'
SELECT * FROM flights WHERE departure_time BETWEEN 430 AND 530
SELECT * FROM flights WHERE departure_city = 'Detroit' AND destination_city = 'Chicago'
SELECT * FROM flights WHERE departure_city = 'Baltimore' AND arrival_city = 'Philadelphia'
SELECT * FROM flights WHERE departure_city = 'Boston' AND destination_city = 'Denver'
SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Houston'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'Denver' AND day = 'Sunday'
SELECT flight_id FROM flights WHERE departure_city = 'Denver' AND arrival_city = 'Dallas' AND flight_date >= DATEADD(day, 5, GETDATE())
SELECT cost FROM flights WHERE origin = 'BOS' AND destination = 'DEN' OR origin = 'BOS' AND destination = 'DEN'
SELECT * FROM flights WHERE departure_city = 'Indianapolis' AND arrival_city = 'Orlando' AND departure_date = '2023-12-27'
SELECT * FROM flights WHERE departure_city = 'ATL' AND departure_date >= DATEADD(day, 1, CAST('2023-10-27' AS DATE)) AND departure_date < DATEADD(day, 2, CAST('2023-10-27' AS DATE))
SELECT * FROM flights WHERE departure_time BETWEEN '17:00' AND '19:00' AND arrival_city = 'Atlanta'
SELECT aircraft_type FROM aircraft WHERE departure_time < '10:00:00' AND aircraft_type = '737'
SELECT * FROM flights WHERE departure_city = 'Denver' AND departure_time >= '17:00' AND arrival_time <= '20:00'
SELECT * FROM cities WHERE city IN ('denver', 'baltimore')
SELECT * FROM travel_arrangements WHERE origin = 'Dallas' AND destination = 'Pittsburgh'
SELECT * FROM transportation_schedule WHERE location = 'Philadelphia' AND date = 'Wednesday' AND time BETWEEN '08:00:00' AND '12:00:00'
SELECT * FROM flights WHERE departure_city = 'Orlando' AND arrival_city = 'Kansas City'
SELECT * FROM transportation WHERE location = 'Oakland'
SELECT * FROM flights WHERE departure_city = 'DEN' AND arrival_city = 'PHI'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND arrival_city = 'Pittsburgh'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the price of american airlines flight 19 from new york to los angeles [Answer]: 275 USD ``` SELECT price FROM flights WHERE flight_number = 19 AND departure_city = 'New York' AND arrival_city = 'Los Angeles'
SELECT * FROM flights WHERE departure_city = 'Boston' AND destination_city = 'Denver'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND destination_city = 'Pittsburgh'
SELECT * FROM flights WHERE departure_city = 'BOS' AND arrival_city = 'DEN'
SELECT * FROM business_classes WHERE origin = 'SAN FRANCISCO' AND destination = 'DENVER' AND airline = 'UNITED AIRLINES'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the costs of flights from dallas to boston tomorrow [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Boston' AND departure_date = DATE(2023, 10, 26) AND arrival_date = DATE(2023, 10, 27)
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'Dallas' AND transfer_city = 'Atlanta'
SELECT DISTINCT aircraft_type FROM aircraft WHERE departure_city = 'Boston' AND arrival_city = 'San Francisco'
SELECT * FROM flights WHERE departure_city = 'Boston' AND destination_city = 'Denver'
SELECT * FROM flights WHERE departure_city = 'Boston' AND departure_date = ( SELECT MIN(departure_date) FROM flights WHERE departure_city = 'Atlanta' )
SELECT * FROM flights WHERE departure_time = '1:00 PM'
SELECT * FROM flights WHERE departure_city = 'Salt Lake City' AND arrival_city = 'New York City' AND departure_time <= 1800
SELECT * FROM flights WHERE departure_city = 'Oakland' AND departure_date = '12/16' AND arrival_city = 'Dallas'
SELECT * FROM prices WHERE city IN ('Dallas', 'Baltimore')
SELECT fares FROM flights WHERE departure_city = 'DALLAS' AND destination_city = 'SAN FRANCISCO'
SELECT * FROM flights WHERE departure_city = 'Cleveland' AND arrival_city = 'Miami' AND date = '2023-10-27'
SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Philadelphia'
SELECT * FROM flights WHERE departure_city = 'LAS' AND arrival_city = 'NYC' AND date BETWEEN '2023-03-01' AND '2023-03-31'
SELECT * FROM airlines WHERE destination = 'Washington' AND departure_city = 'Boston'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does iah mean [Answer]: The word "iah" means "hello".<eos
SELECT * FROM flights WHERE departure_city = 'Atlanta' AND arrival_city = 'Baltimore' AND arrival_time = '7:00 PM'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'Dallas'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND destination_city = 'Denver' AND day = 'Sunday'
SELECT * FROM flights WHERE departure_city = 'Montreal' AND destination_city = 'Charlotte'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how many flights are there between san francisco and philadelphia on august eighteenth [Answer]: 3 ``` SELECT COUNT(*) FROM flights WHERE departure_city = 'San Francisco' AND arrival_city = 'Philadelphia' AND date = '2023-08-18'
SELECT * FROM cities WHERE city_name = 'boston' AND city_name = 'pittsburgh'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what's the most expensive way i can fly to washington [Answer]: - Commercial airlines: starting at $1,200 - Private jets: starting at $5,000 - Cargo airlines: starting at $1,500
SELECT * FROM flights WHERE departure_airport IN ('LA GUARDIA', 'JFK') AND destination_airport = 'CLEVELAND'
SELECT * FROM flights WHERE origin = 'DEN' AND destination = 'PIT'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the earliest flight from atlanta to boston [Answer]: 2023-03-08 12:00:00 UTC
SELECT flight_date FROM flights WHERE departure_city = 'atlanta' AND arrival_city = 'boston' AND flight_date = '2023-09-05' AND departure_time = '07:00:00'
SELECT * FROM airlines WHERE departure_city = 'Miami' AND departure_date = 'Friday'
SELECT * FROM flights WHERE departure_city = 'Boston' AND departure_date = 'Wednesday' AND arrival_city = 'Denver'
SELECT * FROM flights WHERE departure_city = 'PIT' AND destination_city = 'SFO' AND departure_date = '2023-10-27' AND departure_time = '09:00'
SELECT * FROM transportation WHERE origin = 'Boston' AND destination = 'Downtown'
SELECT * FROM flights WHERE departure_date = 'Saturday' AND arrival_time <= '16:00' AND arrival_time > '12:00'
SELECT * FROM flights WHERE departure_city = 'DENVER' AND destination_city = 'SANFRANCISCO'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the delta flights from dallas to boston [Answer]: ``` SELECT destination FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Boston' AND date BETWEEN '2023-03-01' AND '2023-03-31'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what aircraft is co 1209 [Answer]: 737 SELECT aircraft_name FROM aircraft WHERE aircraft_registration = 'co 1209'<eos
SELECT * FROM flights WHERE departure_date = '2023-10-27' AND departure_time < '12:00:00' AND origin = 'DENV' AND destination = 'CHI'
SELECT * FROM flights WHERE departure_city = 'ATL' AND destination_city = 'BOS'
SELECT * FROM flights WHERE departure_airport = 'SFO' AND arrival_airport = 'BOS'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how many united flights are there to san francisco [Answer]: 5 ``` SELECT COUNT(*) FROM flights WHERE destination = 'San Francisco'
SELECT * FROM flights WHERE departure_city = 'Houston' AND departure_date = 'Tuesday' AND arrival_city = 'Memphis'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the cheapest one way flights from atlanta to pittsburgh [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'ATL' AND arrival_city = 'PIT' AND price < ( SELECT MIN(price) FROM flights WHERE departure_city = 'ATL' AND arrival_city = 'PIT' )
SELECT transportation_type, fare FROM transportation WHERE origin = 'PITTSBURGH AIRPORT' AND destination = 'DOWNTOWN' AND transportation_type = 'GROUND TRANSPORTATION'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND arrival_city = 'Pittsburgh'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND arrival_city = 'Pittsburgh' AND departure_time = 'Monday Morning'
INSERT INTO training (location) VALUES ('Newark')
SELECT * FROM flights WHERE departure_time > '5:00 PM' AND aircraft_type IS NULL
SELECT * FROM cities WHERE city = 'Dallas' OR city = 'Baltimore'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does ff mean [Answer]: 2 SELECT * FROM words WHERE word LIKE '%ff%'<eos
SELECT * FROM flights WHERE departure_airport = 'DEN' AND departure_time < '10:00:00' AND arrival_airport = 'SFO'
SELECT * FROM flights WHERE origin = 'Philadelphia' AND destination = 'Dallas'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the round trip first class fare on united from boston to san francisco [Answer]: 362 USD ``` SELECT round_trip_first_class_fare FROM airlines WHERE origin = 'BOS' AND destination = 'SFO'
SELECT * FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'Denver' AND fare = ( SELECT MIN(fare) FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'Denver' )
SELECT * FROM flights WHERE origin = 'BAL' AND destination = 'SFO'
SELECT * FROM flights WHERE departure_city = 'Baltimore' AND arrival_city = 'Dallas' AND departure_date >= '2023-10-27' AND departure_date <= '2023-10-30'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are all the flights into atlanta's airport [Answer]: ``` SELECT flight_id, destination, departure_time FROM flights WHERE destination = 'Atlanta'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND destination_city = 'Dallas'
SELECT * FROM flights WHERE departure_city = 'SEATTLE' AND arrival_city = 'SLC'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the earliest flight from pittsburgh to san francisco [Answer]: 2023-03-08 12:00:00 UTC ``` SELECT * FROM flights WHERE departure_city = 'pittsburgh' AND arrival_city = 'san francisco' AND departure_date = '2023-03-08' AND departure_time = '12:00:00 UTC'
SELECT * FROM flights WHERE departure_time BETWEEN '12:00:00' AND '17:00:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is ord [Answer]: 65
SELECT flight_id, departure_time, arrival_time FROM flights WHERE departure_time < '5:00 PM' AND departure_time >= '08:00 AM' AND arrival_time < '5:00 PM' AND arrival_time >= '14:00 PM' AND departure_day = 'tuesday'
SELECT * FROM transportation_data WHERE location = 'Boston'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what's the earliest flight from boston to bwi that serves lunch [Answer]: 08:00 AM SELECT * FROM flights WHERE departure_time = '08:00 AM'<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how many flights arrive at general mitchell international [Answer]: 200 SELECT COUNT(*) FROM flights WHERE arrival_airport = 'General Mitchell International'<eos
SELECT destination FROM airlines WHERE destination IN ( SELECT destination FROM airlines WHERE airline_name = 'Canadian Airlines International' )
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what ground transportation is available from the pittsburgh airport to the town [Answer]: ``` SELECT * FROM Transportation WHERE DepartureAirport = 'PIT' AND Destination = 'TOWN'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what's the capacity of an f28 [Answer]: 256GB SELECT capacity FROM storage WHERE model = 'f28'<eos
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what car rentals are available next sunday from denver airport [Answer]: ``` SELECT * FROM car_rentals WHERE pickup_date = '2023-10-27' AND pickup_time >= '09:00:00' AND pickup_location = 'Denver Airport'
SELECT * FROM flights WHERE departure_time > '12:00:00'
SELECT * FROM flights WHERE departure_time > '15:00:00'
SELECT * FROM flights WHERE departure_city = 'Cleveland' AND destination_city = 'Memphis'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does the fare code qw mean [Answer]: The fare code qw means "quarter".<eos
SELECT * FROM flights WHERE departure_city = 'Cincinnati' AND destination_city = 'Toronto'
SELECT * FROM flights WHERE departure_city = 'Las Vegas' AND arrival_city = 'New York'
SELECT * FROM flights WHERE departure_city = 'ATL' AND arrival_city = 'BOS' AND date >= CURRENT_DATE - INTERVAL 1 DAY
SELECT * FROM flights WHERE departure_city = 'Memphis' AND destination_city = 'Las Vegas'
SELECT * FROM flights WHERE departure_city = 'Atlanta' AND arrival_city = 'Baltimore' AND aircraft_type = 'Boeing 757' AND arrival_time >= '7:00 PM'
SELECT * FROM flights WHERE departure_city = 'St. Paul' AND destination_city = 'Kansas City' AND departure_date = 'Friday' AND meal_served = 'Yes'
SELECT * FROM transportation_routes WHERE route_from = 'Boston Airport' AND route_to = 'Boston Downtown'
SELECT * FROM flights WHERE origin = 'BAL' AND destination = 'SFO'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the first class fare for a round trip dallas to denver [Answer]: 375 USD ``` SELECT fare FROM fares WHERE origin = 'Dallas' AND destination = 'Denver'
SELECT * FROM flights WHERE departure_city = 'SEA' AND departure_date = '2023-08-10' AND departure_time > 1700
SELECT * FROM flights WHERE departure_city = 'PIT' AND destination_city = 'DAL' AND departure_time >= '12:00:00' AND fare < 1100
SELECT * FROM flights WHERE departure_city = 'Boston' AND destination_city = 'Dallas'
SELECT * FROM flights WHERE departure_city = 'Baltimore' AND destination_city = 'San Francisco' AND price < 200
SELECT travel_date FROM flights WHERE flight_origin = 'AMERICAN' AND flight_destination = 'SAN FRANCISCO' AND flight_date = '2023-10-27'
SELECT * FROM airlines WHERE departure_time LIKE '%early afternoon%' OR departure_time LIKE 'early%afternoon%'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND departure_date = '2023-10-27' AND departure_time >= 7 AND arrival_city = 'Boston'
SELECT * FROM flights WHERE departure_city = 'Salt Lake City'
SELECT * FROM flights WHERE departure_city = 'Nashville' AND arrival_city = 'St. Louis'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the different classes that an airline offers [Answer]: - Economy - Business - First Class
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what type of ground transportation is available between the airport and downtown san francisco [Answer]: - Amtrak - Greyhound - Uber/Lyft - Public transportation - Taxi
SELECT * FROM flights WHERE departure_city = 'Atlanta' AND destination_city = 'Washington'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is fare code qo mean [Answer]: ``` SELECT fare_code, qo FROM fares
SELECT * FROM flights WHERE airline IN ('American', 'Delta') AND origin = 'Dallas' AND destination = 'Baltimore'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how much does the limousine service cost within pittsburgh [Answer]: 250 ``` SELECT cost FROM limousine_service WHERE city = 'Pittsburgh'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the cheapest one way fare from boston to washington [Answer]: 299 ``` SELECT * FROM fares WHERE origin = 'Boston' AND destination = 'Washington' AND fare = 299
SELECT * FROM flights WHERE departure_city = 'MIA' AND departure_date = '2023-10-27' AND flight_direction = 'S' AND departure_time = '09:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how much does it cost to fly from atlanta to san francisco [Answer]: 2,495 USD ``` SELECT price FROM travel_cost WHERE origin = 'ATL' AND destination = 'SFO'
SELECT * FROM flights WHERE departure_city = 'Denver' AND destination_city = 'San Francisco' AND meal_service = 'Yes'
SELECT * FROM flights WHERE departure_city = 'Cleveland' AND arrival_city = 'Miami' AND departure_time <= 16:00 AND arrival_time >= 16:00
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the classes of service on lufthansa [Answer]: ``` SELECT class_of_service FROM lufthansa WHERE class_of_service IN ('Business Class', 'First Class', 'Economy Class')
SELECT * FROM airlines WHERE destination IN ('DEN', 'WA')
SELECT * FROM flights WHERE flight_number = 270 AND departure_city = 'Denver' AND arrival_city = 'Philadelphia'
SELECT * FROM flights WHERE departure_time BETWEEN '12:00:00' AND '16:00:00' AND departure_airport = 'PIT' AND day = 'FRIDAY'
SELECT * FROM flights WHERE departure_city = 'Cleveland' AND departure_date = '2023-10-27' AND arrival_city = 'Miami'
SELECT * FROM flights WHERE departure_time BETWEEN '5:00 PM' AND '6:00 PM' AND arrival_airport = 'PHL'
SELECT * FROM flights WHERE departure_city = 'Phoenix' AND destination_city = 'Milwaukee' AND day = 'Wednesday'
SELECT * FROM flights WHERE departure_city = 'ATL' AND destination_city = 'DAL' AND departure_time > '12:00' AND fare < 1100
SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Houston'
SELECT flight_id, departure_time, arrival_time FROM flights WHERE departure_time BETWEEN DATE_SUB(NOW(), INTERVAL 18 HOUR) AND NOW()
SELECT * FROM flights WHERE departure_city = 'ATL' AND departure_date = '2023-10-27' AND arrival_city = 'DCA'
SELECT * FROM flights WHERE departure_time < '12:00:00' AND airline = 'American Airlines'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the fare on american airlines flight 928 from dallas fort worth to boston [Answer]: 275 USD ``` SELECT fare FROM flights WHERE flight_number = 928 AND departure_city = 'Dallas, Fort Worth' AND arrival_city = 'Boston'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how far from the airport in the dallas fort worth airport is dallas [Answer]: 20 miles ``` SELECT distance FROM airports WHERE airport_name = 'Dallas/Fort Worth Airport'
SELECT * FROM flights WHERE departure_city = 'Cincinnati' AND departure_date = CURDATE() AND arrival_city = 'Burbank' AND arrival_date = CURDATE() + 1
SELECT airline_name FROM airlines WHERE city = 'San Francisco' OR city = 'Washington'
SELECT * FROM flights WHERE departure_city = 'LAS' AND arrival_city = 'NYC' AND flight_duration = 1440
SELECT * FROM flights WHERE departure_city = 'Dallas' AND destination_city = 'Atlanta'
SELECT * FROM flights WHERE origin = 'PHOENIX' AND destination = 'LAS VEGAS'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND departure_date = 'Sunday' AND airline = 'Continental'
SELECT * FROM flights WHERE departure_city = 'DENVER' AND departure_date = '2023-10-27' AND departure_time >= '12:00:00' AND departure_date BETWEEN '2023-10-27' AND '2023-10-29'
SELECT * FROM flights WHERE departure_airport = 'Love Field' AND arrival_airport IN ( SELECT DISTINCT arrival_airport FROM flights WHERE departure_airport = 'Other Airports' )
SELECT * FROM flights WHERE departure_city = 'Love Field' OR arrival_city = 'Love Field'
SELECT * FROM flights WHERE departure_city = 'BOS' AND arrival_city = 'OAK' AND has_stops = 'YES'
SELECT * FROM fares WHERE origin = 'Dallas' AND destination = 'Atlanta'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is ground transportation between the san francisco airport and the city [Answer]: ``` SELECT * FROM transportation WHERE origin = 'SFO' AND destination = 'CITY'
SELECT * FROM flights WHERE departure_city = 'Atlanta' AND destination_city = 'Denver'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what ground transportation is available in san francisco [Answer]: - BART - Muni - Uber - Lyft
SELECT * FROM flights WHERE origin = 'OAK' AND destination = 'SFO'
SELECT * FROM flights WHERE departure_city = 'New York' AND departure_date = 'Tuesday' AND arrival_city = 'Miami' AND arrival_date = 'Sunday'
SELECT * FROM flights WHERE departure_date = '1991-07-25' AND departure_airport = 'DEN' AND arrival_airport = 'BAL'
SELECT * FROM flights WHERE airline = 'American Airlines' AND origin = 'Milwaukee' AND destination = 'Phoenix'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what's the lowest round trip fare from atlanta to bwi [Answer]: 275 USD ``` SELECT MIN(ROUNDTRIP_FARE) FROM ROUGH_AIRLINES WHERE DESTINATION = 'BWI' AND ORIGIN = 'ATL'
SELECT * FROM airlines WHERE departure_city = 'Toronto' AND arrival_city = 'Denver'
SELECT fare FROM fares WHERE date = '2023-11-07' AND route = 'SF-OAK'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does ewr mean [Answer]: The word "ewr" means "excellent".<eos
SELECT * FROM flights WHERE departure_time >= '06:00' AND departure_time < '12:00' AND airline_name = 'Continental Airlines'
SELECT * FROM flights WHERE departure_city = 'DEN' AND arrival_city = 'BAL' AND airline_name = 'UNITED'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND destination_city = 'Dallas'
SELECT * FROM flights WHERE departure_time = 'midnight' AND destination = 'oakland'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how much does flight ua 297 from denver to san francisco cost [Answer]: 275 USD ``` SELECT price FROM flights WHERE flight_number = 'UA297' AND departure_city = 'DENVER' AND arrival_city = 'SANFRANCISCO'
SELECT flight_id FROM flights WHERE departure_city = 'Philadelphia' AND destination_city = 'San Francisco'
SELECT * FROM flights WHERE departure_city = 'atlanta' AND departure_date = 'thursday'
SELECT * FROM flights WHERE departure_time < '10:00:00'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND destination_city = 'Dallas'
SELECT * FROM flights WHERE departure_city = 'Kansas City' AND destination_city = 'Cleveland' AND departure_day = 'Wednesday'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND departure_time >= '09:00:00' AND arrival_city = 'Baltimore'
SELECT city FROM airlines WHERE airline_name = 'Canadian Airlines International'
SELECT * FROM car_rentals WHERE city = 'Baltimore'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND arrival_city = 'Boston' AND has_stopover = 'Yes' AND airline_name = 'Delta Airlines'
SELECT * FROM flights WHERE departure_city = 'Boston' AND departure_time >= '17:00:00' AND departure_class = 'Economy' AND departure_date = '2023-11-11'
SELECT * FROM flights WHERE departure_city = 'ATL' AND arrival_city = 'BOS'
SELECT * FROM flights WHERE departure_city = 'Cincinnati' AND destination_city = 'Houston'
SELECT * FROM flights WHERE origin IN ('DENVER', 'SFO') AND destination IN ('SAN FRANCISCO', 'PHI')
SELECT * FROM flights WHERE departure_city = 'New York' AND arrival_city = 'Miami'
SELECT airline_name FROM airlines WHERE EXISTS ( SELECT 1 FROM routes WHERE origin_city = 'PIT' AND destination_city = 'BAL' )
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is sa [Answer]: 123 SELECT * FROM table WHERE column = 'sa'<eos
SELECT * FROM flights WHERE departure_airport = 'BWI' AND destination_airport = 'DEN'
SELECT * FROM flights WHERE departure_city = 'Atlanta' AND departure_date = 'Thursday' AND departure_time < 0900
SELECT * FROM flights WHERE departure_city = 'Newark' AND arrival_city = 'Nashville'
SELECT * FROM flights WHERE departure_city = 'Baltimore' AND destination_city = 'Dallas'
SELECT * FROM flights WHERE departure_city = 'Boston' AND destination_city = 'Washington DC' AND departure_date = '2023-11-11'
SELECT * FROM transportation WHERE origin = 'Orlando International' AND destination = 'Orlando'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND destination_city = 'San Francisco'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from las vegas to burbank on saturday may twenty two [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'LAS' AND arrival_city = 'BUR' AND departure_date = '2022-05-20' AND departure_time >= '09:00:00' AND departure_time <= '17:00:00'
SELECT * FROM flights WHERE departure_city = 'ATL' AND departure_date = '2023-10-27' AND arrival_city = 'STL' AND arrival_time >= '2300'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'San Francisco' AND airline_name = 'American Airlines'
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND departure_date = 'Sunday' AND arrival_city = 'St. Louis'
SELECT * FROM flights WHERE departure_city = 'PIT' AND arrival_city = 'NEW'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: on the 8am flight from san francisco to atlanta what type of aircraft is used [Answer]: 737 ``` SELECT aircraft_type FROM flights WHERE flight_time = '8:00 AM' AND destination = 'Atlanta'
SELECT * FROM transportation_routes WHERE route_description LIKE '%ground transport%' AND city = 'Seattle'
SELECT * FROM flights WHERE departure_city = 'PIT' AND arrival_city = 'BOS' AND price = ( SELECT MIN(price) FROM flights WHERE departure_city = 'PIT' AND arrival_city = 'BOS' )
SELECT * FROM flights WHERE departure_time BETWEEN DATE_ADD(hour, 12, GETDATE()) AND DATE_ADD(hour, 18, GETDATE())
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what afternoon flights are available from atlanta to san francisco [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Atlanta' AND arrival_city = 'San Francisco' AND date >= '2023-10-27' AND date <= '2023-10-30'
SELECT * FROM flights WHERE departure_city = 'Baltimore' AND arrival_city = 'Philadelphia'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND destination_city = 'Dallas'
SELECT flight_id, origin, destination, number_of_stops FROM flights WHERE origin = 'BOS' AND destination = 'SFO' AND number_of_stops > 3
SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Baltimore' AND price = ( SELECT MIN(price) FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Baltimore' )
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: when is the first flight leaving from oakland to boston [Answer]: 2023-10-27 12:00:00 ``` SELECT * FROM flights WHERE departure_city = 'Oakland' AND departure_date = '2023-10-27' AND departure_time = '12:00:00'
SELECT * FROM flights WHERE date = '2023-10-26' AND origin = 'atlanta' AND destination = 'washington'
SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Boston' AND departure_date >= (SELECT MIN(departure_date) FROM flights) AND arrival_date <= (SELECT MAX(arrival_date) FROM flights)
SELECT * FROM flights WHERE departure_city = 'pittsburgh' AND arrival_city = 'denver'
SELECT * FROM flights WHERE departure_city = 'St. Petersburg' AND arrival_city = 'Milwaukee' AND date = '2023-10-27'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND destination_city = 'Charlotte'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'Dallas' AND has_one_stop = 1
SELECT * FROM flights WHERE departure_city = 'Oakland' AND arrival_city = 'Boston'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: can you list costs of denver rental cars [Answer]: ``` SELECT * FROM rental_cars WHERE city = 'Denver' AND rental_date BETWEEN '2023-01-01' AND '2023-12-31'
SELECT * FROM flights WHERE departure_city = 'MINneapolis' AND destination_city = 'SAN_DIEGO' AND coach_economy_fare > 200
SELECT * FROM flights WHERE departure_city = 'Atlanta' AND arrival_city = 'Denver'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airlines flies out of atlanta [Answer]: ``` SELECT * FROM airlines WHERE departure_city = 'Atlanta'
SELECT fares FROM fares WHERE route = 'Oakland to Dallas' AND travel_date BETWEEN '2023-12-16' AND travel_date < '2023-12-17'
SELECT * FROM airlines WHERE departure_city = 'Boston' AND destination_city = 'Atlanta'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the fares for flights serving a meal from boston to pittsburgh before noon on thursday [Answer]: ``` SELECT fare FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'Pittsburgh' AND departure_time BETWEEN '08:00:00' AND '12:00:00' AND day = 'Thursday'
SELECT * FROM flights WHERE departure_city = 'Denver' AND arrival_city = 'Philadelphia'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights between dallas and pittsburgh on july eight [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Pittsburgh' AND departure_date = '2023-07-08'
SELECT flight_time FROM flights WHERE airline = 'united' AND flight_date = '2023-09-20' AND flight_origin = 'PHL' AND flight_destination = 'SFO'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'Baltimore'
SELECT * FROM flights WHERE origin = 'OAK' AND destination = 'BOS' AND has_stopover = 'YES' AND stopover_cities IN ('DAL', 'DFW')
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND arrival_city = 'Pittsburgh'
SELECT * FROM flights WHERE departure_city = 'Columbus' AND arrival_city = 'Baltimore'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what does fare code qx mean [Answer]: ``` SELECT code FROM fares WHERE code LIKE '%qx%'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'Dallas' AND arrival_time >= '12:00 PM'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how much does it cost to fly on delta from dallas to baltimore [Answer]: 275 USD ``` SELECT price FROM flights WHERE origin = 'DAL' AND destination = 'BAL' AND date = '2023-10-27'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: on eastern flight 825 flying from atlanta to denver can you tell me what type of aircraft is used on a flight when it leaves at 555 [Answer]: 737 SELECT aircraft_type FROM aircraft WHERE flight_number = 825 AND departure_city = 'Atlanta' AND departure_time = '555'<eos
SELECT flight_id FROM flights WHERE departure_time = '838am' AND origin = 'BOS' AND destination = 'OAK'
SELECT * FROM flights WHERE departure_time = 'Saturday Morning' AND departure_city = 'Chicago'
SELECT code_y FROM table_name
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights and fares from boston to philadelphia [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'Philadelphia'
SELECT * FROM flights WHERE departure_city = 'WA' AND destination_city = 'DEN'
SELECT * FROM flights WHERE departure_city = 'PIT' AND destination_city = 'ATL'
SELECT * FROM transportation WHERE location = 'San Francisco' AND type = 'Ground Transportation'
SELECT * FROM flights WHERE departure_city = 'Phoenix' AND departure_day = 'Wednesday' AND arrival_city = 'Milwaukee'
SELECT * FROM flights WHERE airline = 'Delta' AND route LIKE '%ATL%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the yn code [Answer]: 123456789 SELECT code FROM table_name WHERE code = 123456789<eos
SELECT * FROM flights WHERE departure_city = 'Atlanta' AND departure_date = '2023-10-27' AND flight_day = 'Wednesday' AND arrival_city = 'Washington DC'
SELECT * FROM flights WHERE departure_time >= '16:00:00' AND departure_time < '20:00:00'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND destination_city = 'Washington, D.C.'
SELECT flight_date, flight_time FROM flights WHERE flight_date = '2023-11-07' ORDER BY flight_time
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what morning flights do you have between oakland and denver [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Oakland' AND arrival_city = 'Denver'
SELECT * FROM flights WHERE departure_time = '2:00 PM' AND departure_origin = 'Philadelphia' AND arrival_destination = 'Denver'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from kansas city to burbank on saturday may twenty two on america west [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Kansas City' AND departure_date = '2022-05-22' AND destination_city = 'Burbank'
SELECT * FROM flights WHERE departure_city = 'Detroit' AND arrival_city = 'St. Petersburg'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the cheapest round trip flight from atlanta to pittsburgh [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'ATL' AND arrival_city = 'PIT' AND price = ( SELECT MIN(price) FROM flights WHERE departure_city = 'ATL' AND arrival_city = 'PIT' )
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'Dallas'
SELECT COUNT(*) FROM flights WHERE departure_city IN ( SELECT DISTINCT departure_city FROM flights WHERE departure_date = CURDATE() )
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what flights do you have from baltimore to san francisco [Answer]: ``` SELECT flight_id, origin, destination, departure_time, arrival_time FROM flights WHERE origin = 'BAL' AND destination = 'SFO'
SELECT * FROM aircraft WHERE airline = 'Canadian Airlines'
SELECT * FROM flights WHERE departure_city = 'BALtimore' AND arrival_city = 'PHILADELPHIA' AND arrival_time > 2100
SELECT * FROM flights WHERE departure_city = 'PIT' AND departure_date = 'Wednesday'
SELECT * FROM flights WHERE departure_city = 'Denver' AND destination_city IN ('Pittsburgh', 'Atlanta')
SELECT * FROM flights WHERE origin = 'BAL' AND destination = 'SFO' AND has_stop = 'YES' AND has_stopover = 'YES' AND stopover_cities IN ('DEN', 'SAN')
SELECT * FROM cities WHERE city_name = 'Oakland' AND city_name = 'Philadelphia'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND departure_date = 'Saturday'
SELECT * FROM flights WHERE departure_airport = ANY(SELECT departure_airport FROM flights WHERE destination_airport = 'love field')
SELECT * FROM flights WHERE departure_city = 'Boston' AND departure_time >= '08:00:00' AND arrival_city = 'Denver'
SELECT * FROM flights WHERE departure_time >= '2023-04-06 06:00:00'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND arrival_city = 'Miami' AND price = ( SELECT MIN(price) FROM flights WHERE departure_city = 'Memphis' AND arrival_city = 'Miami' )
SELECT * FROM flights WHERE departure_city = 'Denver' AND arrival_city = 'San Francisco' AND day = 'Wednesday'
SELECT * FROM transportation_routes WHERE route_name = 'Dallas Airport to Downtown Dallas'
SELECT * FROM flights WHERE departure_city = 'Atlanta' AND departure_date = '2023-10-27' AND flight_price = 124
INSERT INTO flights (origin, destination, departure_date, departure_time) VALUES ('Philadelphia', 'Boston', '2023-04-16 20:00')
SELECT * FROM flights WHERE departure_city = 'Houston' AND arrival_city = 'Las Vegas'
SELECT * FROM flights WHERE departure_city = 'San Jose' AND arrival_city = 'St Paul'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how many seats in a 734 [Answer]: 12 SELECT COUNT(*) FROM seats WHERE seat_capacity = 734<eos
SELECT definition FROM words WHERE word = 'ewr'
SELECT * FROM flights WHERE flight_number = 813 AND departure_city = 'Boston' AND arrival_city = 'Oakland' AND EXISTS ( SELECT 1 FROM flights WHERE flight_number = 813 AND departure_city = 'Another_City' )
SELECT * FROM flights WHERE departure_city = 'PIT' AND arrival_city = 'NYC'
SELECT * FROM flights WHERE flight_number = 497766 AND departure_airport = 'St. Petersburg' AND arrival_airport = 'Milwaukee' AND departure_time >= 'tomorrow morning'
SELECT airline_name FROM airlines WHERE airline_abbreviation = 'EA'
CREATE TABLE airline ( id INT NOT NULL AUTO_INCREMENT, name VARCHAR(255) NOT NULL, city VARCHAR(255) NOT NULL, country VARCHAR(255) NOT NULL, PRIMARY KEY (id) )
SELECT * FROM transportation WHERE location = 'Denver'
SELECT * FROM airlines WHERE departure_city = 'Phoenix' AND arrival_city = 'Denver'
SELECT * FROM flights WHERE departure_time = '3:00' AND destination = 'denver'
SELECT * FROM flights WHERE departure_city = 'Orlando' AND destination_city = 'San Diego' AND aircraft_type = 'Boeing 737'
SELECT price FROM flights WHERE flight_time = '718am' AND departure_city = 'LAS' AND arrival_city = 'NYC'
SELECT * FROM transportation_data WHERE location = 'Denver'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from pittsburgh to denver and back [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'PIT' AND arrival_city = 'DEN' OR departure_city = 'DEN' AND arrival_city = 'PIT'
SELECT * FROM transportation WHERE location = 'San Francisco'
SELECT * FROM flights WHERE departure_time < '12:00:00' AND airline = 'Northwest Airlines'
SELECT flight_id, destination, departure_time FROM flights WHERE destination = 'General Mitchell International'
SELECT * FROM flights WHERE departure_city = 'DEN' AND arrival_city = 'PHI'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what limousine service is in boston [Answer]: ``` SELECT * FROM limousine_service WHERE location = 'Boston'
SELECT * FROM flights WHERE departure_city = 'Baltimore'
SELECT * FROM table_name WHERE column_name LIKE '%ap/80%'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: could you please give me the cost of a round trip flight from denver to pittsburgh [Answer]: 349 USD **Note:** The cost of a round trip flight from Denver to Pittsburgh is 349 USD.<eos
SELECT * FROM airlines WHERE departure_city = 'Boston' AND destination_city = 'San Francisco'
SELECT * FROM flights WHERE departure_city = 'PIT' AND destination_city = 'SFO'
SELECT fare FROM flights WHERE departure_city = 'BOS' AND arrival_city = 'PHL'
SELECT * FROM flights WHERE departure_city = 'Denver, CO' AND arrival_city = 'Dallas, TX' AND departure_time >= '14:00:00' AND departure_time <= '17:00:00'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND destination_city = 'Kansas City' AND departure_date = '2023-06-17' AND departure_time BETWEEN '19:00:00' AND '21:00:00'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what flight from boston to atlanta arrives earliest in atlanta [Answer]: ``` SELECT flight_id FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'Atlanta' AND arrival_time >= ( SELECT arrival_time FROM flights WHERE departure_city = 'Atlanta' AND arrival_city = 'Boston' ORDER BY arrival_time ASC LIMIT 1 )
SELECT * FROM flights WHERE departure_time BETWEEN '530' AND '700' AND departure_city = 'Toronto'
SELECT * FROM flights WHERE departure_city = 'ATL' AND destination_city = 'PIT'
SELECT * FROM flights WHERE departure_date = '2023-10-22' AND departure_time = '09:00' AND arrival_airport = 'PHL'
SELECT * FROM airports WHERE location = 'Washington, DC'
INSERT INTO flights (origin, destination, date) VALUES ('Denver', 'Boston', '2023-10-21')
SELECT * FROM flights WHERE departure_city = 'Denver' AND date >= CURRENT_DATE - INTERVAL 7 DAY
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the ground transportation from boston airport to boston downtown [Answer]: 20 minutes by car, 30 minutes by bus. ``` SELECT ground_transportation FROM transportation WHERE origin = 'Boston Airport' AND destination = 'Boston Downtown'
SELECT * FROM flights WHERE departure_city = 'Tampa' AND arrival_city = 'Milwaukee' AND departure_date = DATE_ADD(NOW(), INTERVAL 1 DAY) AND departure_time = '12:00 PM EST'
SELECT * FROM destinations WHERE city = 'San Diego' AND city = 'Denver'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND destination_city = 'Washington DC' AND month = 12
SELECT * FROM flights WHERE departure_city = 'BALtimore' AND departure_date = '2023-10-27' AND departure_time BETWEEN '09:00:00' AND '12:00:00'
SELECT * FROM flights WHERE departure_city = 'DENVER' AND departure_date >= DATE_SUB(NOW(), INTERVAL 2 DAY) AND arrival_city = 'PHILADELPHIA'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the coach class fares on flights from pittsburgh to atlanta [Answer]: 150$ for domestic flights and 200$ for international flights. ``` SELECT coach_class_fares FROM flights WHERE origin = 'PIT' AND destination = 'ATL'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: is there an airport limousine at the atlanta airport [Answer]: ``` SELECT * FROM AIRPORT_LIMOUSINE WHERE AIRPORT_ID = 12345
SELECT * FROM flights WHERE departure_city = 'Boston' AND departure_date = '2023-10-27' ORDER BY departure_time DESC
SELECT * FROM flights WHERE departure_city = 'Charlotte' AND destination_city = 'Atlanta' AND date = 'next tuesday'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the cost of round trip ticket first class between oakland and atlanta [Answer]: $$1,200$$<eos
SELECT * FROM flights WHERE departure_city = 'Nashville' AND destination_city = 'Seattle'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what's the first class fare round trip from atlanta to denver [Answer]: 375 USD ``` SELECT * FROM fares WHERE origin = 'ATL' AND destination = 'DEN' AND class = 'FIRST'
SELECT * FROM cities WHERE city = 'Newark' AND city = 'Cleveland' AND date = 'Daily'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how much is a round trip fare from indianapolis to seattle [Answer]: 375 USD ``` SELECT ROUND(Fare, 2) AS FareAmount FROM Destinations WHERE City = 'Indianapolis' AND City = 'Seattle'
SELECT flight_id FROM flights WHERE departure_city = 'San Francisco' AND destination_city = 'Pittsburgh' AND day = 'Monday' AND class = 'First Class'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND departure_date = 'Saturday' AND departure_time = 'Morning'
SELECT * FROM flights WHERE departure_city = 'PIT' AND destination_city = 'LAX' AND day = 'THURSDAY' AND departure_time BETWEEN '18:00:00' AND departure_time < '22:00:00'
SELECT * FROM flights WHERE date = '2023-12-27' AND origin = 'IND' AND destination = 'ORD'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND arrival_city = 'Philadelphia' AND departure_date >= '2023-09-15'
SELECT * FROM flights WHERE departure_city = 'BOS' AND arrival_city = 'OAK' AND departure_date <= arrival_date
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what kind of ground transportation is there in washington dc [Answer]: - Metro - Bus - Car
SELECT * FROM flights WHERE departure_city = 'WA' AND destination_city = 'SF'
SELECT * FROM table_name WHERE column_name = 'value' AND column_name > 'another_value'
SELECT * FROM flights WHERE departure_date = '2023-05-15' AND departure_time BETWEEN '17:00:00' AND '19:00:00' AND origin = 'PHL' AND destination = 'OAK'
SELECT * FROM flights WHERE departure_city = 'St. Paul' AND destination_city = 'Kansas City' AND departure_date = 'Friday' AND meal = 'Yes'
SELECT * FROM flights WHERE departure_city = 'Long Beach' AND arrival_city = 'St. Louis' AND has_stops = 1 AND pickup_city IN ('Dallas')
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how long does it take to get from kansas city to st. paul [Answer]: 1 hour and 45 minutes. ``` SELECT TIMESTAMPDIFF(MINUTE, kansas_city, st.paul) AS duration
SELECT * FROM flights WHERE departure_city = 'Los Angeles' AND destination_city = 'Pittsburgh'
SELECT * FROM flights WHERE departure_city = 'Denver' AND arrival_city = 'Philadelphia'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND destination_city = 'San Francisco'
SELECT * FROM flights WHERE departure_city = 'DENVER' AND destination_city = 'SAN FRANCISCO' AND day = 'TUESDAY' AND month = 'OCTOBER' AND year = '2023'
SELECT * FROM flights WHERE departure_city = 'Denver' AND destination_city = 'Salt Lake City'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what classes of service does twa have [Answer]: ``` SELECT service_category FROM services WHERE service_category IN ('Travel', 'Accommodation', 'Food')
SELECT * FROM flights WHERE departure_time BETWEEN '17:00:00' AND '19:00:00' AND destination = 'oakland'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what's the earliest flight from dallas to houston [Answer]: 2023-03-08 12:00:00 UTC ``` SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Houston' AND departure_date = '2023-03-08'
SELECT * FROM flights WHERE departure_city = 'Baltimore' AND departure_airport = 'BWI' AND arrival_city = 'Seattle' AND arrival_airport = 'SEA'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND arrival_city = 'Boston' AND has_stop_over = 'Yes' AND stopover_cities IN ('Dallas Fort Worth')
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how far is the airport from san francisco [Answer]: 30 miles ``` SELECT distance FROM airports WHERE airport_name = 'San Francisco International Airport'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airline is dl [Answer]: ``` SELECT airline FROM airlines WHERE airline_id = dl
SELECT * FROM flights WHERE departure_date = (SELECT MAX(departure_date) FROM flights)
SELECT flight_id, arrival_time FROM flights WHERE arrival_airport = 'General Mitchell International Airport'
SELECT * FROM flights WHERE departure_city = 'New York' AND destination_city = 'Los Angeles' AND has_stop = 'Yes' AND departure_city IN ('Milwaukee')
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND arrival_city = 'Dallas' AND airline = 'American Airlines'
SELECT * FROM flights WHERE departure_city = 'Westchester County' AND destination_city = 'Cincinnati'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND arrival_city = 'Pittsburgh'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the lowest cost for a one way ticket from boston to washington [Answer]: 299 ``` SELECT MIN(cost) FROM flights WHERE origin = 'BOS' AND destination = 'WAW'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the latest evening flight leaving san francisco for washington [Answer]: 2023-10-27 19:00 ``` SELECT * FROM flights WHERE departure_time = '2023-10-27 19:00'
SELECT DISTINCT ground_transport FROM transportation WHERE ground_transport IN ('Greyhound', 'Amtrak')
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what type of airplane is an m80 [Answer]: 747-800 series.<eos
SELECT * FROM flights WHERE departure_time < '9:00:00'
SELECT * FROM economy WHERE city IN ('Dallas', 'Baltimore')
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airport is at tampa [Answer]: ``` SELECT airport FROM airports WHERE airport_name = 'Tampa International Airport'
SELECT * FROM flights WHERE departure_city = 'Boston' AND departure_date = CURDATE()
SELECT fares FROM routes WHERE origin = 'ATL' AND destination = 'BAL'
SELECT * FROM flights WHERE departure_city = 'BALtimore' AND destination_city = 'Dallas' AND departure_date = '2023-07-29'
SELECT * FROM fares WHERE origin = 'Houston' AND destination = 'Las Vegas'
SELECT * FROM fares WHERE departure_city = 'New York' AND departure_date = 'Tuesday'
SELECT * FROM sfo WHERE location = 'denver'
SELECT flight_id, origin, destination FROM flights WHERE origin = 'Dallas' AND destination = 'Tampa'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND departure_date >= DATE_SUB(NOW(), INTERVAL 1 DAY) AND airline = 'United Airlines' AND earliest_flight = TRUE
SELECT * FROM trips WHERE origin = 'Baltimore' AND destination = 'Philadelphia'
SELECT * FROM flights WHERE departure_city = 'Phoenix' AND destination_city = 'Detroit' AND date = 'Tuesday'
SELECT * FROM flights WHERE departure_city = 'Toronto' AND arrival_city = 'San Diego' AND stops IN ('St. Louis')
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: could you tell me what the earliest flight that goes between atlanta and denver is which serves a meal [Answer]: 05:00 AM SELECT * FROM flights WHERE departure_city = 'Atlanta' AND arrival_city = 'Denver' AND departure_time = '05:00 AM'<eos
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND arrival_city = 'Atlanta'
SELECT * FROM flights WHERE departure_city = 'WA' AND destination_city = 'PH' AND month = 12 AND day = 2
SELECT * FROM flights WHERE departure_city = 'Baltimore' AND arrival_city = 'San Francisco' AND departure_time = 'Friday 8:00 PM'
SELECT * FROM cities WHERE city IN ('Boston', 'San Francisco')
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what type of aircraft does eastern fly from atlanta to denver before 6pm [Answer]: 737</blockquote><eos
SELECT * FROM flights WHERE departure_time = 'tomorrow morning' AND origin = 'columbus' AND destination = 'nashville'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND destination_city = 'Boston' AND departure_date = '1991-08-31'
SELECT * FROM fares WHERE departure_city = 'New York' AND departure_date = 'Tuesday' AND arrival_city = 'Miami'
SELECT * FROM flights WHERE departure_city = 'Phoenix' AND destination_city = 'Milwaukee' AND airline = 'American Airlines' AND day = 'Wednesday'
SELECT * FROM flights WHERE departure_city = 'Tampa' AND destination_city = 'Cincinnati'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what kind of ground transportation is there in philadelphia [Answer]: - Amtrak trains - SEPTA buses - SEPTA light rail - SEPTA subways
SELECT * FROM rentals WHERE location = 'Washington, DC'
SELECT * FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'Atlanta' OR arrival_city = 'Atlanta' AND departure_city = 'Atlanta'
SELECT fares FROM routes WHERE origin = 'Dallas' AND destination = 'San Francisco'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how far is downtown from the airport in dallas [Answer]: 20 miles ``` SELECT distance FROM distances WHERE location1 = 'Dallas Airport' AND location2 = 'Downtown Dallas'
SELECT * FROM fares WHERE origin = 'SAN JOSE' AND destination = 'SALT LAKE CITY'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the fare from san francisco to dallas fort worth on delta flight 852 [Answer]: 275 USD ``` SELECT fare FROM flights WHERE flight_number = 852 AND airline = 'Delta'
SELECT * FROM flights WHERE departure_city = 'PIT' AND departure_time >= '18:00' AND departure_time < '19:00' AND arrival_city = 'PHI'
SELECT fare FROM routes WHERE origin = 'Dallas' AND destination = 'Baltimore' AND fare = ( SELECT MIN(fare) FROM routes WHERE origin = 'Dallas' AND destination = 'Baltimore' )
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the early morning flights from boston to denver [Answer]: ``` SELECT * FROM flights WHERE departure_time BETWEEN '07:00' AND '11:00'
SELECT * FROM fares WHERE origin = 'Denver' AND destination = 'Atlanta' AND fare_class = 'Economy'
SELECT * FROM flights WHERE departure_city = 'BALtimore' AND departure_date = '2023-03-08' AND departure_time = '08:00:00' AND arrival_city = 'DALLAS'
SELECT * FROM flights WHERE departure_city = 'Chicago' AND destination_city = 'Nashville'
SELECT * FROM flights WHERE departure_city = 'BOS' AND departure_date = '1992-01-01' AND arrival_city = 'SFO'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND destination_city = 'Denver' AND day = 'Thursday'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: please tell me how many nonstop flights there are from boston to atlanta [Answer]: 5 ``` SELECT COUNT(*) FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'Atlanta'
SELECT * FROM flights WHERE departure_airport = 'OAK' AND arrival_airport = 'BOS' AND airline = 'TWA'
SELECT * FROM flights WHERE departure_city = 'LAS' AND destination_city = 'NYC' AND duration = 1
SELECT * FROM flights WHERE departure_city = 'Boston' AND departure_time < '05:00:00' AND departure_date = 'Thursday'
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND destination_city = 'Dallas' AND stops IN ('Atlanta')
SELECT * FROM flights WHERE departure_city = 'St. Petersburg' AND departure_date = '2023-10-27' AND departure_time = '09:00'
SELECT airline_name FROM airlines WHERE city = 'Pittsburgh'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how much does flight ua 270 from denver to philadelphia cost [Answer]: 275 USD ``` SELECT price FROM flights WHERE flight_number = 'UA270' AND origin = 'DEN' AND destination = 'PHI'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what airlines go to pittsburgh [Answer]: ``` SELECT airline_name FROM airlines WHERE city = 'Pittsburgh'
SELECT * FROM flights WHERE departure_city = 'Memphis' AND arrival_city = 'Tacoma' OR departure_city = 'Los Angeles' AND arrival_city = 'Tacoma'
SELECT * FROM flights WHERE departure_city = 'PIT' AND arrival_city = 'PHI'
SELECT * FROM flights WHERE departure_city = 'Toronto' AND arrival_city = 'San Francisco'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what's the fare for delta flight 217 from dallas to san francisco [Answer]: 275 USD ``` SELECT fare FROM flights WHERE flight_number = '217' AND origin = 'DALLAS' AND destination = 'SAN FRANCISCO'
SELECT * FROM flights WHERE departure_time >= '18:00' AND departure_time < '20:00' AND day = 'Wednesday'
SELECT * FROM flights WHERE departure_city = 'Indianapolis' AND departure_date = CURDATE() AND arrival_city = 'San Diego' AND arrival_date = CURDATE() + INTERVAL 1 DAY
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what flights are available from boston to denver today [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'Denver' AND departure_date = CURDATE() AND arrival_date = CURDATE()
SELECT * FROM routes WHERE departure_airport = 'PIT' AND arrival_airport = 'PIT' AND route_date BETWEEN '2023-10-27' AND '2023-10-30'
SELECT * FROM flights WHERE departure_city = 'Milwaukee' AND destination_city = 'Montreal'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what is the earliest flight you have leaving boston heading to philadelphia [Answer]: 2023-03-01 12:00:00 ``` SELECT * FROM flights WHERE departure_city = 'Boston' AND destination_city = 'Philadelphia' AND departure_date = '2023-03-01'
SELECT flight_number FROM flights WHERE departure_city = 'Minneapolis' AND destination_city = 'Long Beach' AND month = 6 AND day = 26
SELECT * FROM flights WHERE departure_city = 'Philadelphia' AND destination_city = 'Dallas' AND has_stops = 'Yes'
SELECT airline FROM airlines WHERE departure_city = 'PIT' AND destination_city = 'SFO' AND day = 'MONDAY' AND month = 'SEPTEMBER' AND year = '2023'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: what are the flights from boston to san francisco [Answer]: ``` SELECT * FROM flights WHERE departure_city = 'Boston' AND arrival_city = 'San Francisco'
SELECT * FROM flights WHERE departure_city = 'Boston' AND destination_city = 'Denver' AND departure_date = '2023-07-29'
SELECT * FROM Planes WHERE DepartureCity = 'Pittsburgh' AND ArrivalCity = 'Baltimore'
SELECT CURDATE() + INTERVAL '1 day' + '09:00:00' AS travel_time FROM dual
SELECT * FROM flights WHERE flight_number = 417 AND origin = 'Cincinnati' AND destination = 'Dallas'
SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Atlanta'
SELECT * FROM transportation WHERE origin = 'BOS' AND destination = 'GBX' OR origin = 'GBX' AND destination = 'BOS'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND destination_city = 'Las Vegas'
SELECT * FROM flights WHERE departure_city = 'Houston' AND departure_date = 'Friday' AND airline = 'American Airlines'
os>Convert the following natural language instruction into its equivalent SQL instruction. Ensure your response is a syntactically valid SQL instruction. Only return the output and nothing else. [Instruction]: how much does it cost to get downtown from the atlanta airport by limousine [Answer]: 150 ``` SELECT cost FROM fares WHERE route = 'atlanta airport' AND vehicle_type = 'limousine'
SELECT * FROM flights WHERE origin = 'DEN' AND destination = 'PIT'
SELECT * FROM flights WHERE departure_city = 'San Francisco' AND departure_date >= '2023-10-27' AND departure_date <= '2023-10-30'
SELECT * FROM fares WHERE origin = 'Seattle' AND destination = 'Minneapolis'
SELECT * FROM transportation WHERE origin = 'Airport' AND destination = 'Downtown Phoenix'
SELECT * FROM flights WHERE departure_city = 'San Jose' AND departure_date = '2023-06-03' AND departure_time = '08:00'
SELECT * FROM flights WHERE departure_date = '2023-06-01' AND departure_airport = 'DALLAS' AND arrival_airport = 'SAN FRANCISCO'
SELECT * FROM flights WHERE departure_city = 'DEN' AND arrival_city = 'PIT' AND price = ( SELECT MIN(price) FROM flights WHERE departure_city = 'DEN' AND arrival_city = 'PIT' )
SELECT * FROM flights WHERE departure_airport = 'SAN' AND arrival_airport = 'DUB' AND aircraft_type = 'BOeing 767'
SELECT * FROM airlines WHERE departure_city = 'Boston' AND arrival_city = 'Washington DC' AND EXISTS ( SELECT 1 FROM cities WHERE cities.city = ANY( SELECT city FROM airlines WHERE departure_city = 'Boston' AND arrival_city = 'Washington DC' ) )
SELECT * FROM flights WHERE departure_city = 'Dallas' AND arrival_city = 'Oakland' AND departure_time <= '12:00:00'
