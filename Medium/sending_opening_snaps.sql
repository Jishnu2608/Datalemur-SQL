/*Assume you're given tables with information on Snapchat users, including their ages and 
time spent sending and opening snaps.

Write a query to obtain a breakdown of the time spent sending vs. opening snaps as a percentage 
of total time spent on these activities grouped by age group. Round the percentage to 2 decimal 
places in the output.

Notes:

Calculate the following percentages:
time spent sending / (Time spent sending + Time spent opening)
Time spent opening / (Time spent sending + Time spent opening)
To avoid integer division in percentages, multiply by 100.0 and not 100.*/

with cte as (
  select user_id,
  sum(case when activity_type = 'open' then time_spent else 0 end) as open_time,
  sum(case when activity_type = 'send' then time_spent else 0 end) as send_time
  from activities group by 1
  )
  
select a.age_bucket, round(sum(c.send_time) * 100.0/ (sum(c.send_time) + sum(c.open_time)),2) as send_perc,
round(sum(c.open_time) * 100.0/ (sum(c.send_time) + sum(c.open_time)),2) as open_perc
from cte c join age_breakdown a on c.user_id = a.user_id group by 1;