/*CVS Health is analyzing its pharmacy sales data, and how well different products are selling in the market. 
Each drug is exclusively manufactured by a single manufacturer.

Write a query to identify the manufacturers associated with the drugs that resulted in losses for CVS Health 
and calculate the total amount of losses incurred.

Output the manufacturer's name, the number of drugs associated with losses, and the total losses in 
\absolute value. Display the results sorted in descending order with the highest losses displayed at the top.*/

CREATE TABLE pharmacy_sales (
    product_id INT,
    units_sold INT,
    total_sales DECIMAL(15,2),
    cogs DECIMAL(15,2),
    manufacturer VARCHAR(100),
    drug VARCHAR(100)
);

-- Insert data into pharmacy_sales
INSERT INTO pharmacy_sales (product_id, units_sold, total_sales, cogs, manufacturer, drug) VALUES
(156, 89514, 3130097.00, 3427421.73, 'Biogen',       'Acyclovir'),
(25,  222331, 2753546.00, 2974975.36, 'AbbVie',      'Lamivudine and Zidovudine'),
(50,  90484, 2521023.73, 2742445.90, 'Eli Lilly',    'Dermasorb TA Complete Kit'),
(98,  110746, 813188.82, 140422.87,  'Biogen',       'Medi-Chord');

with cte as (select manufacturer, count(drug) as drugs, 
abs((total_sales - cogs)) as losses from pharmacy_sales where (total_sales - cogs) < 0 
group by 1, 3)

select manufacturer, sum(drugs) as drug_count, sum(losses) as total_loss from cte group by 1
order by drug_count desc;