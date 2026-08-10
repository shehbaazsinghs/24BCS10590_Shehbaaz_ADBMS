select E1.employee_NAME AS Employee , E2.employee_NAME AS Manager
FROM employees AS E1
left JOIN employees AS E2
ON E1.Manager_ID=E2.employee_ID;

select C1.customer_name,P1.product_name FROM customers AS C1
cross JOIN products AS P1