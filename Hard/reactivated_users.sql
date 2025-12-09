/*Imagine you're provided with a table containing information about user logins on Facebook in 2022. 
Write a query that determines the number of reactivated users for a given month. 
Reactivated users are those who were inactive the previous month but logged in during the current month.

Output the month in numerical format along with the count of reactivated users.

Here's some important assumptions to consider:

The user_logins table only contains data for the year 2022 and there are no missing dates within that period.
For instance, if a user whose first login date is on 3 March 2022, we assume that they had previously 
logged in during the year 2021. Although the data for their previous logins is not present in the 
user_logins table, we consider these users as reactivated users.*/

CREATE TABLE user_logins (
    user_id INT,
    login_date DATETIME
);

-- Insert data into user_logins
-- Converted to MySQL datetime format YYYY-MM-DD HH:MM:SS
INSERT INTO user_logins (user_id, login_date) VALUES
(123, '2022-02-22 12:00:00'),
(112, '2022-03-15 12:00:00'),
(245, '2022-03-28 12:00:00'),
(123, '2022-05-01 12:00:00'),
(725, '2022-05-25 12:00:00');

with cte as (select *, month(login_date) as mth from user_logins),
cte2 as (select *, lag(mth) over(partition by user_id order by login_date) as prev_mth from cte)

select mth, count(distinct user_id) as reactivated_users from cte2 
where prev_mth is null or mth - prev_mth > 1 group by 1;