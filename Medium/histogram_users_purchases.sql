/*Assume you're given a table on Walmart user transactions. Based on their most recent transaction date, 
write a query that retrieve the users along with the number of products they bought.

Output the user's most recent transaction date, user ID, and the number of products, sorted in 
chronological order by the transaction date.*/

CREATE TABLE user_transactions (
    product_id INT,
    user_id INT,
    spend DECIMAL(10,2),
    transaction_date DATETIME
);

-- Insert data into user_transactions
-- Converted to MySQL datetime format YYYY-MM-DD HH:MM:SS
INSERT INTO user_transactions (product_id, user_id, spend, transaction_date) VALUES
(3673, 123,  68.90, '2022-07-08 12:00:00'),
(9623, 123, 274.10, '2022-07-08 12:00:00'),
(1467, 115,  19.90, '2022-07-08 12:00:00'),
(2513, 159,  25.00, '2022-07-08 12:00:00'),
(1452, 159,  74.50, '2022-07-10 12:00:00');

with cte as (select *, rank() over(partition by user_id order by transaction_date desc) rn from user_transactions
)
select transaction_date, user_id, count(product_id) as purchase_count from cte where rn = 1 group by 1, 2 order by 1
