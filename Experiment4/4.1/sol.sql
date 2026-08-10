select customer_name , order_date
FROM customers 
INNER JOIN
orders on
customers.customer_id = orders.customer_id;

select customer_name , product_name 
from customers left join
orders on
customers.customer_id = orders.customer_id;

select products.product_name , order_date
from products INNER join
orders on products.product_name = orders.product_name;