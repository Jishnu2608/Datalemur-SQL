/*Assume you're given a table with measurement values obtained from a Google sensor over 
multiple days with measurements taken multiple times within each day.

Write a query to calculate the sum of odd-numbered and even-numbered measurements separately 
for a particular day and display the results in two different columns. 
Refer to the Example Output below for the desired format.

Definition:

Within a day, measurements taken at 1st, 3rd, and 5th times are considered odd-numbered measurements, 
and measurements taken at 2nd, 4th, and 6th times are considered even-numbered measurements.*/

-- Create measurements table
CREATE TABLE measurements (
    measurement_id INT,
    measurement_value DECIMAL(10,2),
    measurement_time DATETIME
);

-- Insert data into measurements
-- Converted dates to MySQL format YYYY-MM-DD HH:MM:SS
INSERT INTO measurements (measurement_id, measurement_value, measurement_time) VALUES
(131233, 1109.51, '2022-07-10 09:00:00'),
(135211, 1662.74, '2022-07-10 11:00:00'),
(523542, 1246.24, '2022-07-10 13:15:00'),
(143562, 1124.50, '2022-07-11 15:00:00'),
(346462, 1234.14, '2022-07-11 16:45:00');

select concat(date(measurement_time), ' 00:00:00') as measurement_day, sum(case when rn%2 = 1 then measurement_value else 0 end) as odd_sum,
sum(case when rn%2 = 0 then measurement_value else 0 end) as even_sum from cte group by 1 order by 1;


