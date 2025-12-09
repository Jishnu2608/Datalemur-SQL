/*Assume you're given a table containing data on Amazon customers and their spending 
on products in different category, write a query to identify the top two highest-grossing 
products within each category in the year 2022. The output should include the category, 
product, and total spend.*/

-- Create product_spend table
CREATE TABLE product_spend (
    category VARCHAR(50),
    product VARCHAR(100),
    user_id INT,
    spend DECIMAL(10,2),
    transaction_date DATETIME
);

-- Insert data into product_spend
-- Converted dates to MySQL format YYYY-MM-DD HH:MM:SS
INSERT INTO product_spend (category, product, user_id, spend, transaction_date) VALUES
('appliance',   'refrigerator',      165, 246.00, '2021-12-26 12:00:00'),
('appliance',   'refrigerator',      123, 299.99, '2022-03-02 12:00:00'),
('appliance',   'washing machine',   123, 219.80, '2022-03-02 12:00:00'),
('electronics', 'vacuum',            178, 152.00, '2022-04-05 12:00:00'),
('electronics', 'wireless headset',  156, 249.90, '2022-07-08 12:00:00'),
('electronics', 'vacuum',            145, 189.00, '2022-07-15 12:00:00');

with cte as (
  select category, product, sum(spend) as total_spend, row_number() 
  over(partition by category order by spend desc) as rn from product_spend group by 1,2)

select category, product, total_spend from cte where rn in (1,2)
