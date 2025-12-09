/*Given a table of tweet data over a specified time period, calculate the 3-day rolling average 
of tweets for each user. Output the user ID, tweet date, and rolling averages rounded to 2 decimal places.

Notes:

A rolling average, also known as a moving average or running mean is a time-series technique that 
examines trends in data over a specified period of time.
In this case, we want to determine how the tweet count for each user changes over a 3-day period.*/

-- Create tweets table
CREATE TABLE tweets (
    user_id INT,
    tweet_date TIMESTAMP,
    tweet_count INT
);

-- Insert data into tweets
-- Converted to MySQL timestamp format YYYY-MM-DD HH:MM:SS
INSERT INTO tweets (user_id, tweet_date, tweet_count) VALUES
(111, '2022-06-01 00:00:00', 2),
(111, '2022-06-02 00:00:00', 1),
(111, '2022-06-03 00:00:00', 3),
(111, '2022-06-04 00:00:00', 4),
(111, '2022-06-05 00:00:00', 5);

select user_id, tweet_date, round(avg(tweet_count) over(partition by user_id order by tweet_date 
rows between 2 preceding and current row),2) as rolling_avg_3d
from tweets;