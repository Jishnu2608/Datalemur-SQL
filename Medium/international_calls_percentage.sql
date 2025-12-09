/*A phone call is considered an international call when the person calling is in a different 
country than the person receiving the call.

What percentage of phone calls are international? Round the result to 1 decimal.

Assumption:

The caller_id in phone_info table refers to both the caller and receiver.*/


CREATE TABLE phone_calls (
    caller_id INT,
    receiver_id INT,
    call_time DATETIME
);

-- Insert data into phone_calls
INSERT INTO phone_calls (caller_id, receiver_id, call_time) VALUES
(1, 2, '2022-07-04 10:13:49'),
(1, 5, '2022-08-21 23:54:56'),
(5, 1, '2022-05-13 17:24:06'),
(5, 6, '2022-03-18 12:11:49');

CREATE TABLE phone_info (
    caller_id INT,
    country_id VARCHAR(10),
    network VARCHAR(50),
    phone_number VARCHAR(50)
);

-- Insert data into phone_info
INSERT INTO phone_info (caller_id, country_id, network, phone_number) VALUES
(1, 'US', 'Verizon',  '+1-212-897-1964'),
(2, 'US', 'Verizon',  '+1-703-346-9529'),
(3, 'US', 'Verizon',  '+1-650-828-4774'),
(4, 'US', 'Verizon',  '+1-415-224-6663'),
(5, 'IN', 'Vodafone', '+91 7503-907302'),
(6, 'IN', 'Vodafone', '+91 2287-664895');

with cte as (select c.caller_id, c.receiver_id, i.country_id caller_country, i2.country_id receiver_country, i.phone_number
from phone_calls c join phone_info i on c.caller_id = i.caller_id
join phone_info i2 on c.receiver_id = i2.caller_id)

select round(100.0 * sum(case when caller_country != receiver_country then 1 else 0 end) / 
(select count(*) from cte),2) as international_calls_pct