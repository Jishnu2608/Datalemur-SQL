/*You're given a table containing the item count for each order on Alibaba, along with the 
frequency of orders that have the same item count. Write a query to retrieve the mode of the order 
occurrences. Additionally, if there are multiple item counts with the same mode, 
the results should be sorted in ascending order.

Clarifications:

item_count: Represents the number of items sold in each order.
order_occurrences: Represents the frequency of orders with the corresponding number of items sold per order.
For example, if there are 800 orders with 3 items sold in each order, the record would have an 
item_count of 3 and an order_occurrences of 800.*/

CREATE TABLE items_per_order (
    item_count INT,
    order_occurrences INT
);

-- Insert data into items_per_order
INSERT INTO items_per_order (item_count, order_occurrences) VALUES
(1, 500),
(2, 1000),
(3, 800);

with cte as (
  select *, rank() over(order by order_occurrences desc) rn from items_per_order)

select item_count as mode from cte where rn = 1;