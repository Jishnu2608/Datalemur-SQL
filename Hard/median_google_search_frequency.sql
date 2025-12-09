/*Google's marketing team is making a Superbowl commercial and needs a simple statistic to 
put on their TV ad: the median number of searches a person made last year.

However, at Google scale, querying the 2 trillion searches is too costly. Luckily, you have 
access to the summary table which tells you the number of searches made last year and how many 
Google users fall into that bucket.

Write a query to report the median of searches made by a user. Round the median to one decimal point.*/

-- Create search_frequency table
CREATE TABLE search_frequency (
    searches INT,
    num_users INT
);

-- Insert data into search_frequency
INSERT INTO search_frequency (searches, num_users) VALUES
(1, 2),
(2, 2),
(3, 3),
(4, 1);

with cte as (
select *, row_number() over(order by searches) as rn,
count(*) over() as total_count from search_frequency
)

select round(avg(searches), 1) as median from cte where 
rn in (ceil(total_count/2), floor(total_count/2))