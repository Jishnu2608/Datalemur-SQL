/*Assume you're given a table containing information about Wayfair user transactions 
for different products. Write a query to calculate the year-on-year growth rate for the 
total spend of each product, grouping the results by product ID.

The output should include the year in ascending order, product ID, current year's spend, 
previous year's spend and year-on-year growth percentage, rounded to 2 decimal places.*/

CREATE TABLE user_transactions (
    transaction_id INT,
    product_id INT,
    spend DECIMAL(10,2),
    transaction_date DATETIME
);

-- Insert data into user_transactions
-- Converted to MySQL datetime format YYYY-MM-DD HH:MM:SS
INSERT INTO user_transactions (transaction_id, product_id, spend, transaction_date) VALUES
(1341, 123424, 1500.60, '2019-12-31 12:00:00'),
(1423, 123424, 1000.20, '2020-12-31 12:00:00'),
(1623, 123424, 1246.44, '2021-12-31 12:00:00'),
(1322, 123424, 2145.32, '2022-12-31 12:00:00');

with cte as (
	select year(transaction_date) as year, product_id, spend as curr_year_spend, lag(spend) over(partition by product_id order by year(transaction_date))
    as prev_year_spend from user_transactions)
select *, round((curr_year_spend - prev_year_spend) * 100.0 / prev_year_spend,2) as yoy_rate from cte;
