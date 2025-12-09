/*A Microsoft Azure Supercloud customer is defined as a customer who has purchased at least one 
product from every product category listed in the products table.

Write a query that identifies the customer IDs of these Supercloud customers.*/

-- Create customer_contracts table
CREATE TABLE customer_contracts (
    customer_id INT,
    product_id INT,
    amount INT
);

-- Insert data into customer_contracts
INSERT INTO customer_contracts (customer_id, product_id, amount) VALUES
(1, 1, 1000),
(1, 3, 2000),
(1, 5, 1500),
(2, 2, 3000),
(2, 6, 2000);


-- Create products table
CREATE TABLE products (
    product_id INT,
    product_category VARCHAR(100),
    product_name VARCHAR(100)
);

-- Insert data into products
INSERT INTO products (product_id, product_category, product_name) VALUES
(1, 'Analytics',   'Azure Databricks'),
(2, 'Analytics',   'Azure Stream Analytics'),
(4, 'Containers',  'Azure Kubernetes Service'),
(5, 'Containers',  'Azure Service Fabric'),
(6, 'Compute',     'Virtual Machines'),
(7, 'Compute',     'Azure Functions');


select c.customer_id from customer_contracts c join products p 
on c.product_id = p.product_id group by 1 having count(distinct product_category)
= (select count(distinct product_category) from products)