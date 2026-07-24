CREATE DATABASE retail_sales_db;

CREATE TABLE retail_sales (
	transactions_id INT PRIMARY KEY,
	sale_date DATE,
	sale_time TIME,
	customer_id INT,
	gender VARCHAR(15),
	age INT NULL,
	category VARCHAR(15),
	quantity INT NULL,
	price_per_unit FLOAT NULL,
	cogs FLOAT NULL,
	total_sale FLOAT NULL
);

-- Write a query to retrieve all columns for the first 10 transactions in the dataset.
SELECT * FROM retail_sales
LIMIT 10;

-- Find all sales transactions where the category is 'Beauty'.
SELECT * FROM retail_sales
WHERE category = 'Beauty';

-- Find all transactions where the category is 'Clothing' AND the quantity purchased is 3 or more.
SELECT * FROM retail_sales
WHERE category = 'Clothing' AND quantity >= 3;

-- List all unique product categories available in the dataset.
SELECT DISTINCT category FROM retail_sales;

-- How many total transactions were made for each category?
SELECT category, COUNT(*) AS total_transactions FROM retail_sales
GROUP BY category;

-- What is the total revenue (total_sale) generated across each category?
SELECT category, SUM(total_sale) AS total_revenue FROM retail_sales
GROUP BY category;

-- What is the average customer age for each gender?
SELECT gender, CAST(AVG(age) AS DECIMAL(10,2)) as average_customer_age FROM retail_sales
GROUP BY gender;

-- Find all categories that have a total sales revenue greater than $50,000 (Hint: Use HAVING).
SELECT category, SUM(total_sale) AS total_sales_revenue FROM retail_sales
GROUP BY category
HAVING SUM(total_sale) > 50000;

-- Calculate the total profit for each category. (Formula: total_sale - cogs)
SELECT category, CAST(SUM(total_sale - cogs) AS DECIMAL(10,2)) AS total_profit FROM retail_sales
GROUP BY category;

-- Write a query to find the top 5 customers (customer_id) who spent the highest total amount.
SELECT customer_id, SUM(total_sale) AS total_spent FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 5;

