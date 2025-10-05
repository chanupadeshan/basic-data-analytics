USE DataWarehouseAnalytics;
GO

-- Explore the all objects in the database
SELECT *
FROM INFORMATION_SCHEMA.TABLES

-- Explore the all columns in the database
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'gold' AND TABLE_NAME = 'dim_customers'