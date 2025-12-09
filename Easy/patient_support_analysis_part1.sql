/*UnitedHealth Group (UHG) has a program called Advocate4Me, which allows policy holders (or, members) 
to call an advocate and receive support for their health care needs – whether that's claims and benefits 
support, drug coverage, pre- and post-authorisation, medical records, emergency assistance, or 
member portal services.

Write a query to find how many UHG policy holders made three, or more calls, assuming each call is 
identified by the case_id column.*/

-- Create callers table
CREATE TABLE callers (
    policy_holder_id INT,
    case_id VARCHAR(100),
    call_category VARCHAR(100),
    call_date DATETIME,
    call_duration_secs INT
);

-- Insert data into callers
-- ISO timestamps converted to MySQL DATETIME format YYYY-MM-DD HH:MM:SS
INSERT INTO callers (policy_holder_id, case_id, call_category, call_date, call_duration_secs) VALUES
(1, 'f1d012f9-9d02-4966-a968-bf6c5bc9a9fe', 'emergency assistance', '2023-04-13 19:16:53', 144),
(1, '41ce8fb6-1ddd-4f50-ac31-07bfcce6aaab', 'authorisation',        '2023-05-25 09:09:30', 815),
(2, '9b1af84b-eedb-4c21-9730-6f099cc2cc5e', 'claims assistance',    '2023-01-26 01:21:27', 992),
(2, '8471a3d4-6fc7-4bb2-9fc7-4583e3638a9e', 'emergency assistance', '2023-03-09 10:58:54', 128),
(2, '38208fae-bad0-49bf-99aa-7842ba2e37bc', 'benefits',             '2023-06-05 07:35:43', 619);

with cte as (select policy_holder_id, count(case_id) as call_count 
from callers group by policy_holder_id having count(case_id) >= 3)

select count(policy_holder_id) as policy_holder_count from cte;
