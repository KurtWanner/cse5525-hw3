SELECT * FROM flights WHERE departure_city = 'DEN' AND arrival_city = 'PHI' AND departure_date = DATE_SUB(NOW(), INTERVAL 1 DAY)
