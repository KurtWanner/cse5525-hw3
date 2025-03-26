SELECT DISTINCT flight_id FROM flight WHERE from_airport = 'ATL' AND to_airport = 'BAL'
SELECT DISTINCT flight_id FROM flight WHERE from_airport = 'DAL' AND to_airport = 'BOS'
SELECT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE flight_1.flight_day = 'FRIDAY' AND flight_1.flight_time >= '17:00:00' AND airport_service_1.city_name = 'HOUSTON' AND airport_service_2.city_name = 'MILWAUKEE'
SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE city_1.city_name = 'BOSTON' AND city_2.city_name = 'DENVER'
SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE city_1.city_name = 'DENVER' AND city_2.city_name = 'PHILADELPHIA'
SELECT DISTINCT flight_1.flight_id FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE flight_1.departure_time = ( SELECT MIN( flight_1.departure_time ) FROM flight flight_1 , airport_service airport_service_1 ON flight_1.from_airport = airport_service_1.airport_code , city city_1 ON airport_service_1.city_code = city_1.city_code , airport_service airport_service_2 ON flight_1.to_airport = airport_service_2.airport_code , city city_2 ON airport_service_2.city_code = city_2.city_code WHERE city_1.city_name = 'Denver' AND city_2.city_name = 'Boston' )
SELECT DISTINCT flight_id FROM flight WHERE to_airport = 'SAN FRANCISCO' AND departure_date = '2023-08-08'
SELECT flight_id FROM flight WHERE departure_time BETWEEN '1400' AND '1700' AND ( from_airport = 'OAKLAND' AND to_airport = 'PHILADELPHIA' AND arrival_time >= '1500' )
SELECT DISTINCT fare_1.fare_id FROM fare fare_1 WHERE fare_1.round_trip_cost = ( SELECT MIN( fare_1.round_trip_cost ) FROM fare fare_1 WHERE fare_1.fare_id = fare_1.fare_id AND fare_1.from_airport = 'DALLAS' AND fare_1.to_airport = fare_1.to_airport )
SELECT flight_id FROM flight WHERE departure_time BETWEEN 0 AND 800 AND ( from_airport = 'BOS' AND to_airport = 'BAL' )
