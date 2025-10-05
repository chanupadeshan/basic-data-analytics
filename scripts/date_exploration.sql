USE DataWarehouseAnalytics;
GO



-- find the date of the first and last order
SELECT MIN(order_date) AS FirstOrderDate,
       MAX(order_date) AS LastOrderDate
FROM gold.fact_sales;

--how many years of data do we have?
SELECT MIN(order_date) AS FirstOrderDate,
       MAX(order_date) AS LastOrderDate,
       DATEDIFF(year, MIN(order_date), MAX(order_date)) AS NumberOfYears
FROM gold.fact_sales;


--find the youngest and oldest customer
SELECT MIN(birthdate) AS oldest_age,
       DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_age_years,
       MAX(birthdate) AS youngest_age,
       DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_age_years
FROM gold.dim_customers;