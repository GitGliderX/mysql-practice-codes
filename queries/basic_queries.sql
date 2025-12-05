
# 1. View all customer records
SELECT * FROM customers;

#2. Select unique cities
SELECT DISTINCT city FROM customers;

#3. Retrieve customer names with their emails
SELECT customer_name, email
FROM customers;

#4. Find products with price greater than 500
SELECT product_name, price
FROM products
WHERE price > 500;

#5. Sort employees by salary (highest first)
SELECT employee_name, salary
FROM employees
ORDER BY salary DESC;
