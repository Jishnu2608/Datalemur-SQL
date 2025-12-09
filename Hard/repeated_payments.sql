/*Sometimes, payment transactions are repeated by accident; it could be due to user error, 
API failure or a retry error that causes a credit card to be charged twice.

Using the transactions table, identify any payments made at the same merchant with the same credit card 
for the same amount within 10 minutes of each other. Count such repeated payments.

Assumptions:

The first transaction of such payments should not be counted as a repeated payment. This means, 
if there are two transactions performed by a merchant with the same credit card and for the same 
amount within 10 minutes, there will only be 1 repeated payment.*/

CREATE TABLE transactions (
    transaction_id INT,
    merchant_id INT,
    credit_card_id INT,
    amount INT,
    transaction_timestamp DATETIME
);

-- Insert data into transactions
-- Converted to MySQL datetime format YYYY-MM-DD HH:MM:SS
INSERT INTO transactions (transaction_id, merchant_id, credit_card_id, amount, transaction_timestamp) VALUES
(1, 101, 1, 100, '2022-09-25 12:00:00'),
(2, 101, 1, 100, '2022-09-25 12:08:00'),
(3, 101, 1, 100, '2022-09-25 12:28:00'),
(4, 102, 2, 300, '2022-09-25 12:00:00'),
(6, 102, 2, 400, '2022-09-25 14:00:00');

select count(t1.transaction_id) as payment_count 
from transactions t1 join transactions t2 
on t1.merchant_id = t2.merchant_id and t1.credit_card_id = t2.credit_card_id 
and t1.amount = t2.amount and t1.transaction_id <> t2.transaction_id
and t1.transaction_timestamp < t2.transaction_timestamp
and timestampdiff(second, t1.transaction_timestamp, t2.transaction_timestamp) <= 600;

