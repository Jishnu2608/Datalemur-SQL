/*Assume you have an events table on Facebook app analytics. Write a query to calculate the 
click-through rate (CTR) for the app in 2022 and round the results to 2 decimal places.

Definition and note:

Percentage of click-through rate (CTR) = 100.0 * Number of clicks / Number of impressions
To avoid integer division, multiply the CTR by 100.0, not 100.*/

-- Create events table
CREATE TABLE events (
    app_id INT,
    event_type VARCHAR(50),
    timestamp DATETIME
);

-- Insert data into events
-- Converted to MySQL datetime format YYYY-MM-DD HH:MM:SS
INSERT INTO events (app_id, event_type, timestamp) VALUES
(123, 'impression', '2022-07-18 11:36:12'),
(123, 'impression', '2022-07-18 11:37:12'),
(123, 'click',      '2022-07-18 11:37:42'),
(234, 'impression', '2022-07-18 14:15:12'),
(234, 'click',      '2022-07-18 14:16:12');

select app_id, round(100.0 * sum(case when event_type = 'click' then 1 else 0 end) /
    sum(case when event_type = 'impression' then 1 else 0 end),2) as ctr
    from events where year(timestamp) = 2022 group by app_id