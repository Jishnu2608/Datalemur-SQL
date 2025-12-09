/*Assume you're given a table containing information on Facebook user actions.
Write a query to obtain number of monthly active users (MAUs) in July 2022, including the 
month in numerical format "1, 2, 3".

Hint:
An active user is defined as a user who has performed actions such as 'sign-in', 'like', or 
'comment' in both the current month and the previous month.*/

-- Create user_actions table
CREATE TABLE user_actions (
    user_id INT,
    event_id INT,
    event_type VARCHAR(20),
    event_date DATETIME
);

-- Insert data into user_actions
-- Converted dates to MySQL format YYYY-MM-DD HH:MM:SS
INSERT INTO user_actions (user_id, event_id, event_type, event_date) VALUES
(445, 7765, 'sign-in', '2022-05-31 12:00:00'),
(445, 3634, 'like',    '2022-06-05 12:00:00'),
(648, 3124, 'like',    '2022-06-18 12:00:00'),
(648, 2725, 'sign-in', '2022-06-22 12:00:00'),
(648, 8568, 'comment', '2022-07-03 12:00:00'),
(445, 4363, 'sign-in', '2022-07-05 12:00:00'),
(445, 2425, 'like',    '2022-07-06 12:00:00'),
(445, 2484, 'like',    '2022-07-22 12:00:00'),
(648, 1423, 'sign-in', '2022-07-26 12:00:00'),
(445, 5235, 'comment', '2022-07-29 12:00:00'),
(742, 6458, 'sign-in', '2022-07-03 12:00:00'),
(742, 1374, 'comment', '2022-07-19 12:00:00');

with cte as (select user_id from user_actions where month(event_date) = 7 and year(event_date) = 2022
intersect
select user_id from user_actions where month(event_date) = 6 and year(event_date) = 2022)

select 7 as month, count(*) as active_users from cte;


