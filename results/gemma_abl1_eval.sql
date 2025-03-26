SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE flight_1.to_airport = 'PHOENIX'
SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport airport_1 ON city_1.city_name = 'PHOENIX' , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code , state state_1 ON city_1.state_code = state_1.state_code , state state_2 ON city_2.state_code = state_2.state_code WHERE flight_1.to_airport = 'SALT LAKE CITY'
SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE flight_1.departure_time >= 1000 AND flight_1.departure_time <= 1400
SELECT DISTINCT ground_service_1.transport_type FROM ground_service ground_service_1, city city_1 WHERE ground_service_1.city_code = city_1.city_code AND city_1.city_name = 'DENVER'
SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE flight_1.flight_days = 'TUESDAY' AND flight_1.arrival_time BETWEEN 0 AND 1200
SELECT DISTINCT ground_service_1.transport_type FROM ground_service ground_service_1 WHERE ground_service_1.city_code = city_1.city_code AND city_1.city_name = 'ST. LOUIS'
SELECT DISTINCT flight_1.flight_id FROM flight flight_1 WHERE flight_1.from_airport = 'ST. LOUIS' AND flight_1.to_airport = 'MILWAUKEE' AND flight_1.flight_days = 'WEDNESDAY' AND flight_1.departure_time BETWEEN 1600 AND 1800
SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE flight_1.from_airport = 'WASHINGTON' AND flight_1.to_airport = 'SEATTLE'
SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE flight_1.departure_time > 1200
SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE flight_1.to_airport = 'SEATTLE'
