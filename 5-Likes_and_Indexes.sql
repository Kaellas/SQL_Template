-- LIKES -------------------------------------------------------------------------------------------------

SELECT * FROM employees WHERE last_name LIKE 'Sm%'
-- will retrieve all employees with last names starting with "Sm."

SELECT * FROM products WHERE product_name LIKE '%apple%'
-- will retrieve all products with "apple" anywhere in the product name.

SELECT * FROM customers WHERE email LIKE '_@gmail.com'
-- will retrieve customers with Gmail addresses where the first character before the "@" can 
-- be any single character.

SELECT * FROM words WHERE word LIKE 'c%'
-- will retrieve all words that start with the letter "c."

SELECT * FROM products WHERE LOWER(product_name) LIKE '%apple%'
-- This will match "apple," "Apple," "aPpLe," and so on, regardless of the case.


-- INDEXES -----------------------------------------------------------------------------------------------

-- Create an index
CREATE INDEX idx_example ON example_table (ex_column);

-- Drop an index
DROP INDEX idx_example;


-- EXPLAIN ANALYZE ---------------------------------------------------------------------------------------

EXPLAIN ANALYZE query_example;
-- or
EXPLAIN ANALYZE SELECT * FROM products WHERE category_id = 123;

-- `EXPLAIN` provides information about the execution plan, describing the steps the database 
-- optimiser plans to take when executing the query.

-- `ANALYZE` actually executes the query and measures the time taken for each step, 
-- giving you a detailed report of the query's performance.