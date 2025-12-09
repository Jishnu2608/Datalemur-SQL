/*Your team at JPMorgan Chase is preparing to launch a new credit card, and to gain some insights, 
you're analyzing how many credit cards were issued each month.

Write a query that outputs the name of each credit card and the difference in the number of issued 
cards between the month with the highest issuance cards and the lowest issuance. 
Arrange the results based on the largest disparity.*/

-- Create monthly_cards_issued table
CREATE TABLE monthly_cards_issued (
    card_name VARCHAR(100),
    issued_amount INT,
    issue_month INT,
    issue_year INT
);

-- Insert data into monthly_cards_issued
INSERT INTO monthly_cards_issued (card_name, issued_amount, issue_month, issue_year) VALUES
('Chase Freedom Flex',      55000, 1, 2021),
('Chase Freedom Flex',      60000, 2, 2021),
('Chase Freedom Flex',      65000, 3, 2021),
('Chase Freedom Flex',      70000, 4, 2021),
('Chase Sapphire Reserve', 170000, 1, 2021),
('Chase Sapphire Reserve', 175000, 2, 2021),
('Chase Sapphire Reserve', 180000, 3, 2021);

select card_name, max(issued_amount) - min(issued_amount) as difference
from monthly_cards_issued group by card_name order by 2 desc
