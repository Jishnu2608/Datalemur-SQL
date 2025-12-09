/*Assume you're given the tables containing completed trade orders and user details in a 
Robinhood trading system.

Write a query to retrieve the top three cities that have the highest number of completed 
trade orders listed in descending order. Output the city name and the corresponding number of 
completed trade orders.*/

CREATE TABLE trades (
    order_id INT,
    user_id INT,
    quantity INT,
    status VARCHAR(20),
    date TIMESTAMP,
    price DECIMAL(5,2)
);

-- Insert data into trades
-- Converted dates to MySQL format YYYY-MM-DD HH:MM:SS
INSERT INTO trades (order_id, user_id, quantity, status, date, price) VALUES
(100101, 111, 10, 'Cancelled', '2022-08-17 12:00:00', 9.80),
(100102, 111, 10, 'Completed', '2022-08-17 12:00:00', 10.00),
(100259, 148, 35, 'Completed', '2022-08-25 12:00:00', 5.10),
(100264, 148, 40, 'Completed', '2022-08-26 12:00:00', 4.80),
(100305, 300, 15, 'Completed', '2022-09-05 12:00:00', 10.00),
(100400, 178, 32, 'Completed', '2022-09-17 12:00:00', 12.00),
(100565, 265, 2,  'Completed', '2022-09-27 12:00:00', 8.70);


-- Create users table
CREATE TABLE users (
    user_id INT PRIMARY KEY,
    city VARCHAR(100),
    email VARCHAR(200),
    signup_date DATETIME
);

-- Insert data into users
INSERT INTO users (user_id, city, email, signup_date) VALUES
(111, 'San Francisco', 'rrok10@gmail.com', '2021-08-03 12:00:00'),
(148, 'Boston', 'sailor9820@gmail.com', '2021-08-20 12:00:00'),
(178, 'San Francisco', 'harrypotterfan182@gmail.com', '2022-01-05 12:00:00'),
(265, 'Denver', 'shadower_@hotmail.com', '2022-02-26 12:00:00'),
(300, 'San Francisco', 'houstoncowboy1122@hotmail.com', '2022-06-30 12:00:00');

with completed_trades as (
	select * from trades where status = 'Completed')
    
select u.city, count(c.order_id) as total_orders from completed_trades c join users u on c.user_id = u.user_id
group by u.city order by 2 desc limit 3;
