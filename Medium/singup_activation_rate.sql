/*New TikTok users sign up with their emails. They confirmed their signup by replying to the 
text confirmation to activate their accounts. Users may receive multiple text messages for account 
confirmation until they have confirmed their new account.

A senior analyst is interested to know the activation rate of specified users in the emails table. 
Write a query to find the activation rate. Round the percentage to 2 decimal places.

Definitions:

emails table contain the information of user signup details.
texts table contains the users' activation information.
Assumptions:

The analyst is interested in the activation rate of specific users in the emails table, which may 
not include all users that could potentially be found in the texts table.
For example, user 123 in the emails table may not be in the texts table and vice versa.*/



CREATE TABLE emails (
    email_id INT,
    user_id INT,
    signup_date DATETIME
);

-- Insert data into emails
-- Converted to MySQL datetime format YYYY-MM-DD HH:MM:SS
INSERT INTO emails (email_id, user_id, signup_date) VALUES
(125, 7771, '2022-06-14 00:00:00'),
(236, 6950, '2022-07-01 00:00:00'),
(433, 1052, '2022-07-09 00:00:00');


-- Create texts table
CREATE TABLE texts (
    text_id INT,
    email_id INT,
    signup_action VARCHAR(50)
);

-- Insert data into texts
INSERT INTO texts (text_id, email_id, signup_action) VALUES
(6878, 125, 'Confirmed'),
(6920, 236, 'Not Confirmed'),
(6994, 236, 'Confirmed');

select round((select count(*) as confirmed from texts where signup_action = "Confirmed")/ count(*),2) as confirm_rate 
from emails e join texts t on e.email_id = t.email_id