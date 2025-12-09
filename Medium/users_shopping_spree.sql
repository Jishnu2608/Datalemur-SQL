/*In an effort to identify high-value customers, Amazon asked for your help to obtain data about 
users who go on shopping sprees. A shopping spree occurs when a user makes purchases on 3 or more 
consecutive days.

List the user IDs who have gone on at least 1 shopping spree in ascending order.*/



CREATE TABLE transactions (
    user_id INT,
    amount FLOAT,
    transaction_date DATETIME
);

-- Insert data into transactions
-- Converted to MySQL datetime format YYYY-MM-DD HH:MM:SS
INSERT INTO transactions (user_id, amount, transaction_date) VALUES
(1, 9.99,  '2022-08-01 10:00:00'),
(1, 55.00, '2022-08-17 10:00:00'),
(2, 149.50,'2022-08-05 10:00:00'),
(2, 4.89,  '2022-08-06 10:00:00'),
(2, 34.00, '2022-08-07 10:00:00');

with cte as (select *, 
transaction_date - row_number() over(partition by user_id order by transaction_date) as streak_id from transactions),
cte2 as (select user_id, count(*) as count_users from cte group by 1 having count(*) >= 3)

select user_id from cte2 order by user_id;