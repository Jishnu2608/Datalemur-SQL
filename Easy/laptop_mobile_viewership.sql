/*Assume you're given the table on user viewership categorised by device type where 
the three types are laptop, tablet, and phone.

Write a query that calculates the total viewership for laptops and mobile devices where 
mobile is defined as the sum of tablet and phone viewership. Output the total viewership 
for laptops as laptop_reviews and the total viewership for mobile devices as mobile_views.*/

CREATE TABLE viewership (
    user_id INT,
    device_type VARCHAR(20),
    view_time TIMESTAMP
);

-- Insert data into viewership
-- Converted to MySQL timestamp format YYYY-MM-DD HH:MM:SS
INSERT INTO viewership (user_id, device_type, view_time) VALUES
(123, 'tablet', '2022-01-02 00:00:00'),
(125, 'laptop', '2022-01-07 00:00:00'),
(128, 'laptop', '2022-02-09 00:00:00'),
(129, 'phone',  '2022-02-09 00:00:00'),
(145, 'tablet', '2022-02-24 00:00:00');

select sum(case when device_type = 'Laptop' then 1 else 0 end) as laptop_views,
  sum(case when device_type in ('tablet','phone') then 1 else 0 end) as mobile_views
from viewership;
