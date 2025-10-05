USE DataWarehouseAnalytics;
GO

SELECT *
FROM gold.fact_sales;

-- find the total sales
SELECT SUM(sales_amount) AS TotalSales
FROM gold.fact_sales;

-- find how many items were sold
SELECT SUM(quantity) AS TotalQuantitySold
FROM gold.fact_sales;

-- find the average selling price of items
SELECT AVG(price) AS AverageSellingPrice
FROM gold.fact_sales;

-- find the total number of orders
SELECT COUNT(DISTINCT order_number) AS TotalOrders
FROM gold.fact_sales;

-- find the total number of products
SELECT COUNT(DISTINCT product_key) AS TotalProducts
FROM gold.dim_products;

-- find the total number of customers
SELECT COUNT( customer_key) AS TotalCustomers
FROM gold.dim_customers;

-- find the total number of customers that has placed an order
SELECT COUNT(*) AS NullCustomerCount
FROM gold.fact_sales
WHERE customer_key IS NULL;

SELECT COUNT(customer_key) AS TotalCustomersWithOrders 
FROM gold.fact_sales


-- Generate a report that shows all key metrics of the business
SELECT 'Total Sales' AS Metric,
SUM(sales_amount) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Quantity Sold' AS Metric,
SUM(quantity) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Average Selling Price' AS Metric,
AVG(price) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Orders' AS Metric,
COUNT(DISTINCT order_number) AS measure_value
FROM gold.fact_sales

UNION ALL

SELECT 'Total Products' AS Metric,
COUNT(DISTINCT product_key) AS measure_value
FROM gold.dim_products

UNION ALL

SELECT 'Total Customers' AS Metric,
COUNT(customer_key) AS measure_value
FROM gold.dim_customers

UNION ALL

SELECT 'Total Customers with Orders' AS Metric,
COUNT(customer_key) AS measure_value
FROM gold.fact_sales
WHERE customer_key IS NOT NULL

