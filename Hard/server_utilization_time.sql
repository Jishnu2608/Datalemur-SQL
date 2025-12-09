/*Amazon Web Services (AWS) is powered by fleets of servers. Senior management has requested data-driven 
solutions to optimize server usage.

Write a query that calculates the total time that the fleet of servers was running. 
The output should be in units of full days.

Assumptions:

Each server might start and stop several times.
The total time in which the server fleet is running can be calculated as the sum of each server's uptime.*/

-- Create server_utilization table
CREATE TABLE server_utilization (
    server_id INT,
    status_time DATETIME,
    session_status VARCHAR(50)
);

-- Insert data into server_utilization
-- Converted to MySQL datetime format YYYY-MM-DD HH:MM:SS
INSERT INTO server_utilization (server_id, status_time, session_status) VALUES
(1, '2022-08-02 10:00:00', 'start'),
(1, '2022-08-04 10:00:00', 'stop'),
(2, '2022-08-17 10:00:00', 'start'),
(2, '2022-08-24 10:00:00', 'stop');


with cte as (select server_id, session_status, status_time, lead(status_time) over(partition by
server_id order by status_time) as next_status from server_utilization),

cte2 as(select server_id, session_status, datediff(next_status, status_time) as uptime from cte)

select sum(uptime) as total_uptime_days from cte2 where session_status = 'start';
