/*You’re a consultant for a major pizza chain that will be running a promotion where all 3-topping pizzas 
will be sold for a fixed price, and are trying to understand the costs involved.

Given a list of pizza toppings, consider all the possible 3-topping pizzas, and print out the total cost 
of those 3 toppings. Sort the results with the highest total cost on the top followed by pizza toppings 
in ascending order.

Break ties by listing the ingredients in alphabetical order, starting from the first ingredient, 
followed by the second and third.

P.S. Be careful with the spacing (or lack of) between each ingredient. Refer to our Example Output.

Notes:

Do not display pizzas where a topping is repeated. For example, ‘Pepperoni,Pepperoni,Onion Pizza’.
Ingredients must be listed in alphabetical order. For example, 'Chicken,Onions,Sausage'. 'Onion,Sausage,Chicken' 
is not acceptable.*/

-- Create pizza_toppings table
CREATE TABLE pizza_toppings (
    topping_name VARCHAR(255),
    ingredient_cost DECIMAL(10,2)
);

-- Insert data into pizza_toppings
INSERT INTO pizza_toppings (topping_name, ingredient_cost) VALUES
('Pepperoni', 0.50),
('Sausage', 0.70),
('Chicken', 0.55),
('Extra Cheese', 0.40);

select concat(t1.topping_name,',',t2.topping_name,',',t3.topping_name) as pizza, 
(t1.ingredient_cost + t2.ingredient_cost + t3.ingredient_cost) as total_cost
from pizza_toppings t1 join pizza_toppings t2 join pizza_toppings t3
on t1.topping_name < t2.topping_name and t2.topping_name < t3.topping_name
order by total_cost desc, pizza


