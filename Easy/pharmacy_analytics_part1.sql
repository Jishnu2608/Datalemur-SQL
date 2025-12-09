/*CVS Health is trying to better understand its pharmacy sales, and how well different products are selling. 
Each drug can only be produced by one manufacturer.

Write a query to find the top 3 most profitable drugs sold, and how much profit they made. 
Assume that there are no ties in the profits. Display the result from the highest to the lowest total profit.

Definition:

cogs stands for Cost of Goods Sold which is the direct cost associated with producing the drug.
Total Profit = Total Sales - Cost of Goods Sold*/

-- Create pharmacy_sales table
CREATE TABLE pharmacy_sales (
    product_id INT,
    units_sold INT,
    total_sales DECIMAL(12,2),
    cogs DECIMAL(12,2),
    manufacturer VARCHAR(100),
    drug VARCHAR(100)
);

-- Insert data into pharmacy_sales
INSERT INTO pharmacy_sales (product_id, units_sold, total_sales, cogs, manufacturer, drug) VALUES
(9,   37410, 293452.54, 208876.01, 'Eli Lilly',    'Zyprexa'),
(34,  94698, 600997.19, 521182.16, 'AstraZeneca',  'Surmontil'),
(61,  77023, 500101.61, 419174.97, 'Biogen',       'Varicose Relief'),
(136,144814,1084258.00,1006447.73, 'Biogen',       'Burkhart');

with cte as (select total_sales, cogs, drug, (total_sales - cogs) as total_profit from pharmacy_sales)

select drug, total_profit from cte order by total_profit desc limit 3