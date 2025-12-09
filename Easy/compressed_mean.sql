/*You're trying to find the mean number of items per order on Alibaba, rounded to 1 decimal 
place using tables which includes information on the count of items in each order (item_count table) 
and the corresponding number of orders for each item count (order_occurrences table).*/


CREATE TABLE items_per_order (
    item_count INT,
    order_occurrences INT
);

-- Insert data into items_per_order
INSERT INTO items_per_order (item_count, order_occurrences) VALUES
(1, 500),
(2, 1000),
(3, 800),
(4, 1000);

select round(sum(item_count*order_occurrences) / (select sum(order_occurrences) from items_per_order),1) as mean
from items_per_order;