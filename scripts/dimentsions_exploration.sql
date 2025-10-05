USE DataWarehouseAnalytics;
GO


-- explore all countries our customers are from
SELECT *
FROM gold.dim_customers;

SELECT DISTINCT country
FROM gold.dim_customers;


-- explore all product categories
SELECT *
FROM gold.dim_products;

SELECT DISTINCT category,subcategory , product_name
FROM gold.dim_products


