-- =====================

--    CREATE DATABASE

-- =====================

DROP DATABASE IF EXISTS SQL_Practicals;
GO
CREATE DATABASE SQL_Practicals;
GO

USE SQL_Practicals;
GO
-- =====================

--    CREATE SCHEMA

-- =====================

DROP SCHEMA IF EXISTS practical_1;
GO
CREATE SCHEMA practical_1;
GO


-- =====================

--    CREATE TABLE

-- =====================

DROP TABLE IF EXISTS practical_1.product;
GO
CREATE TABLE practical_1.product(
	ProductId INT PRIMARY KEY IDENTITY,
	ProductName VARCHAR(500) NOT NULL,
	category VARCHAR(MAX) NOT NULL,
	Price INT NOT NULL CONSTRAINT positive_price CHECK(	Price > 0)
)
GO

-- =====================

--    ALTER DATABASE

-- =====================

ALTER TABLE practical_1.product
ADD description VARCHAR(MAX);
GO

-- =====================

--    INSERTING DATA

-- =====================

INSERT INTO practical_1.product(ProductName,category,Price, description) VALUES
	('blood pressure moniter','Health',50000,'automatic blood pressure detection'),
	('Vaseline', 'Health', 500, 'This is a vaseline'),
	('Neem Face Wash', 'Health', 1500, 'This is neem face wash'),
	('Paracetamol', 'Health', 1200, 'This is a medicine to get relief from fever'),
	('Trek Powerfly 5 Women''s - 2018', 'Electric Bikes', 20000, 'Trek Powerfly electric bike for women'),
	('real me narzo N53', 'Electronics',  8999, NULL),
	('Samsung Galaxy M13', 'Electronics', 10999, 'This is a samsung galaxy phone'),
	('Lenovo IdeaCentre Gaming 5 Desktop', 'Electronics', 56490, 'lenovo gaming desktop'),
	('Electra Townie 7D (20-inch) - Boys'' - 2017', 'Mountain Bike', 15000, 'This is a Electra Townie the children bicycle'),
	('Sun Bicycles Spider 3i - 2017', 'Mountain Bike', 12000, 'This is a mountain bike')
GO

-- =====================

--       QUERIES 

-- =====================

-- 1) Write a Query to List all the products belonging to health category
SELECT
	ProductId,ProductName,category,Price, description
FROM
	practical_1.product
WHERE
	category = 'Health';
GO

-- 2) Write a Query to get total price of all products
SELECT
	SUM(Price) AS total
FROM
	practical_1.product;
GO

-- 3) Write a query to display product in descending order of price
SELECT
	ProductId, ProductName,category, Price, description
FROM 
	practical_1.product
ORDER BY
	Price DESC;
GO

-- 4) Write a Query to display category wise product count having price greater than  10000
SELECT
	category, COUNT(*) product_count
FROM
	practical_1.product
WHERE
	Price > 10000
GROUP BY
	category
GO