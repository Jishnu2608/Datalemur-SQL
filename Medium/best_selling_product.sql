with cte as (select * from products p join product_sales s on p.product_id = s.product_id
)

select category_name, product_name from (
  select product_name, category_name, sales_quantity, dense_rank() over 
  (partition by category_name order by sales_quantity desc, rating desc) as rnk from cte)
f where rnk = 1
