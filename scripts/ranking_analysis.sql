USE DataWarehouseAnalytics;
GO

-- which 5 products generate the most revenue
SELECT TOP 5 
P.product_name,SUM(f.sales_amount) AS HighestRevenue
FROM gold.fact_sales F
LEFT JOIN gold.dim_products P 
ON F.product_key = P.product_key
GROUP BY P.product_name
ORDER BY HighestRevenue DESC

-- use Window function to rank top 5 products by revenue
SELECT TOP 5
P.product_name,
SUM(f.sales_amount) AS HighestRevenue,
ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) DESC) AS RevenueRank
FROM gold.fact_sales F
LEFT JOIN gold.dim_products P 
ON F.product_key = P.product_key
GROUP BY P.product_name



-- which 5 products generate the least revenue
SELECT TOP 5 
P.product_name,SUM(f.sales_amount) AS lowestRevenue
FROM gold.fact_sales F
LEFT JOIN gold.dim_products P 
ON F.product_key = P.product_key
GROUP BY P.product_name
ORDER BY lowestRevenue ASC

-- use Window function to rank bottom 5 products by revenue
SELECT TOP 5 
P.product_name,
SUM(f.sales_amount) AS lowestRevenue,
ROW_NUMBER() OVER (ORDER BY SUM(f.sales_amount) ASC) AS RevenueRank
FROM gold.fact_sales F
LEFT JOIN gold.dim_products P 
ON F.product_key = P.product_key
GROUP BY P.product_name


-- find the top 10 customers who have generated the highest revenue
SELECT TOP 10
C.customer_key,C.first_name,C.last_name,SUM(F.sales_amount) AS HighestRevenueByCustomer
FROM gold.dim_customers C
RIGHT JOIN gold.fact_sales F
ON C.customer_key = F.customer_key
GROUP BY C.customer_key,C.first_name,C.last_name
ORDER BY HighestRevenueByCustomer DESC


-- find the bottom 10 customers who have generated the least revenue
SELECT  TOP 10 C.customer_key,C.first_name,C.last_name,SUM(F.sales_amount) AS LowestRevenueByCustomer
FROM gold.dim_customers C
RIGHT JOIN gold.fact_sales F
ON C.customer_key = F.customer_key
GROUP BY C.customer_key,C.first_name,C.last_name
ORDER BY LowestRevenueByCustomer ASC

