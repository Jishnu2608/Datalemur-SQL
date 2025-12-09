/*Write a query to identify the top 2 Power Users who sent the highest number of messages on 
Microsoft Teams in August 2022. Display the IDs of these 2 users along with the total number of 
messages they sent. Output the results in descending order based on the count of the messages.

Assumption:

No two users have sent the same number of messages in August 2022.*/

CREATE TABLE messages (
    message_id INT,
    sender_id INT,
    receiver_id INT,
    content VARCHAR(255),
    sent_date DATETIME
);

-- Insert data into messages
-- Converted to MySQL datetime format YYYY-MM-DD HH:MM:SS
INSERT INTO messages (message_id, sender_id, receiver_id, content, sent_date) VALUES
(901, 3601, 4500, 'You up?',                       '2022-08-03 00:00:00'),
(902, 4500, 3601, 'Only if you''re buying',        '2022-08-03 00:00:00'),
(743, 3601, 8752, 'Let''s take this offline',      '2022-06-14 00:00:00'),
(922, 3601, 4500, 'Get on the call',               '2022-08-10 00:00:00');

select sender_id, count(message_id) as message_count from messages where date(sent_date) between '2022-08-01' and '2022-08-31' 
group by sender_id order by 2 desc limit 2;

