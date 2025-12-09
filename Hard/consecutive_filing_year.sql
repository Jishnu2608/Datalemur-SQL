/*Intuit, a company known for its tax filing products like TurboTax and QuickBooks, offers multiple 
versions of these products.

Write a query that identifies the user IDs of individuals who have filed their taxes using any 
version of TurboTax for three or more consecutive years. Each user is allowed to file taxes once a 
year using a specific product. Display the output in the ascending order of user IDs.*/

CREATE TABLE filed_taxes (
    filing_id INT,
    user_id VARCHAR(50),
    filing_date DATETIME,
    product VARCHAR(255)
);

-- Insert data into filed_taxes
-- Converted dates to MySQL format YYYY-MM-DD HH:MM:00
INSERT INTO filed_taxes (filing_id, user_id, filing_date, product) VALUES
(1, '1', '2019-04-14 00:00:00', 'TurboTax Desktop 2019'),
(2, '1', '2020-04-15 00:00:00', 'TurboTax Deluxe'),
(3, '1', '2021-04-15 00:00:00', 'TurboTax Online'),
(4, '2', '2020-04-07 00:00:00', 'TurboTax Online'),
(5, '2', '2021-04-10 00:00:00', 'TurboTax Online'),
(6, '3', '2020-04-07 00:00:00', 'TurboTax Online'),
(7, '3', '2021-04-15 00:00:00', 'TurboTax Online'),
(8, '3', '2022-03-11 00:00:00', 'QuickBooks Desktop Pro'),
(9, '4', '2022-04-15 00:00:00', 'QuickBooks Online');

with cte as (select *, lead(product, 1, 0) over(partition by user_id order by filing_date) as next_product,
lead(product, 2, 0) over(partition by user_id order by filing_date) as next_next_product
from filed_taxes)

select user_id from cte where product like "%TurboTax%" and next_product like "%TurboTax%"
and next_next_product like "%TurboTax%"
