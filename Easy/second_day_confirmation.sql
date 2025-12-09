/*Assume you're given tables with information about TikTok user sign-ups and confirmations through email and text. 
New users on TikTok sign up using their email addresses, and upon sign-up, each user receives a text 
message confirmation to activate their account.

Write a query to display the user IDs of those who did not confirm their sign-up on the first day, 
but confirmed on the second day.

Definition:

action_date refers to the date when users activated their accounts and confirmed their sign-up 
through text messages.*/

-- Create emails table
CREATE TABLE emails (
    email_id INT,
    user_id INT,
    signup_date DATETIME
);

-- Insert data into emails
INSERT INTO emails (email_id, user_id, signup_date) VALUES
(125, 7771, '2022-06-14 00:00:00'),
(433, 1052, '2022-07-09 00:00:00');


-- Create texts table
CREATE TABLE texts (
    text_id INT,
    email_id INT,
    signup_action VARCHAR(50),
    action_date DATETIME
);

-- Insert data into texts
INSERT INTO texts (text_id, email_id, signup_action, action_date) VALUES
(6878, 125, 'Confirmed',     '2022-06-14 00:00:00'),
(6997, 433, 'Not Confirmed', '2022-07-09 00:00:00'),
(7000, 433, 'Confirmed',     '2022-07-10 00:00:00');

select e.user_id from emails e join texts t on e.email_id = t.email_id
where datediff(t.action_date, e.signup_date) = 1 and t.signup_action = 'Confirmed'

