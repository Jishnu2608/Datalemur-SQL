/*You're given two tables containing data on Spotify users' streaming activity: songs_history which has 
historical streaming data, and songs_weekly which has data from the current week.

Write a query that outputs the user ID, song ID, and cumulative count of song plays up to August 4th, 2022, 
sorted in descending order.

Assume that there may be new users or songs in the songs_weekly table that are not present in the 
songs_history table.

Definitions:

song_weeklytable only contains data for the week of August 1st to August 7th, 2022.
songs_history table contains data up to July 31st, 2022. The query should include historical 
data from this table.*/

CREATE TABLE songs_history (
    history_id INT,
    user_id INT,
    song_id INT,
    song_plays INT
);

-- Insert data into songs_history
INSERT INTO songs_history (history_id, user_id, song_id, song_plays) VALUES
(10011, 777, 1238, 11),
(12452, 695, 4520, 1);


-- Create songs_weekly table
CREATE TABLE songs_weekly (
    user_id INT,
    song_id INT,
    listen_time DATETIME
);

-- Insert data into songs_weekly
-- Converted to MySQL format YYYY-MM-DD HH:MM:SS
INSERT INTO songs_weekly (user_id, song_id, listen_time) VALUES
(777, 1238, '2022-08-01 12:00:00'),
(695, 4520, '2022-08-04 08:00:00'),
(125, 9630, '2022-08-04 16:00:00'),
(695, 9852, '2022-08-07 12:00:00');

with cte as (select user_id, song_id, song_plays from songs_history
union all 
select user_id, song_id, count(song_id) from songs_weekly
  where listen_time < '2022-08-04 23:59:59' group by 1,2)
  
select user_id, song_id, sum(song_plays)as song_count from cte group by 1, 2
order by song_count desc;
