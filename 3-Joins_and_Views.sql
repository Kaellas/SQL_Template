-- INNER JOIN AND ALIASES ---------------------------------------------------------------------------------

-- Select all columns
SELECT *
FROM orders AS o
INNER JOIN customers AS c 
ON o.customer_id = c.customer_id;

-- Select specific columns
SELECT o.order_date, c.customer_name, c.customer_email
FROM orders AS o
INNER JOIN customers AS c 
ON o.customer_id = c.customer_id;

-- Select specific columns and display them as aliases
SELECT o.order_date AS date, 
c.customer_name AS name,
c.customer_email AS email
FROM orders AS o
INNER JOIN customers AS c 
ON o.customer_id = c.customer_id;

-- Inner join from multiple tables
SELECT *
FROM orders AS o
INNER JOIN customers AS c ON o.customer_id = c.customer_id
INNER JOIN products AS p ON o.product_id = p.product_id;


-- LEFT, RIGHT AND FULL JOINS -----------------------------------------------------------------------------

-- Left join
SELECT *
FROM orders AS o
LEFT JOIN customers AS c 
ON o.customer_id = c.customer_id;

-- Right join
SELECT *
FROM orders AS o
RIGHT JOIN customers AS c 
ON o.customer_id = c.customer_id;

-- Full Join
SELECT *
FROM orders AS o
FULL JOIN customers AS c 
ON o.customer_id = c.customer_id;


-- CREATING A VIEW ----------------------------------------------------------------------------------------

-- basic view
CREATE VIEW view_employees AS
-- Followed by Query expression
-- (usually select + arguments, aliases for columns)
SELECT *
FROM bi.employees;

