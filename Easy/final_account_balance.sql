/*Given a table containing information about bank deposits and withdrawals made using Paypal, 
write a query to retrieve the final account balance for each account, taking into account all the 
transactions recorded in the table with the assumption that there are no missing transactions.*/

-- Create transactions table
CREATE TABLE transactions (
    transaction_id INT,
    account_id INT,
    amount DECIMAL(10,2),
    transaction_type VARCHAR(50)
);

-- Insert data into transactions
INSERT INTO transactions (transaction_id, account_id, amount, transaction_type) VALUES
(123, 101, 10.00, 'Deposit'),
(124, 101, 20.00, 'Deposit'),
(125, 101,  5.00, 'Withdrawal'),
(126, 201, 20.00, 'Deposit'),
(128, 201, 10.00, 'Withdrawal');

select account_id, sum(case when transaction_type = 'Deposit' then amount
when transaction_type = 'Withdrawal' then -amount else 0 end) as final 
from transactions group by account_id;
