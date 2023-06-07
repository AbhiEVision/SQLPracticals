-- =====================

--    CREATE DATABASE

-- =====================

DROP DATABASE IF EXISTS [SQL_Practicals];

CREATE DATABASE [SQL_Practicals];
GO

USE [SQL_Practicals];
GO;
-- =====================

--    CREATE SCHEMA

-- =====================

DROP SCHEMA IF EXISTS [practical_2];
GO
CREATE SCHEMA [practical_2];
GO

-- =====================

--    CREATE TABELS

-- =====================


DROP TABLE IF EXISTS [practical_2].[Department]
GO
CREATE TABLE [practical_2].[Department] ( 
	DepartmentId INT PRIMARY KEY IDENTITY,
	DepartmentName VARCHAR(200) NOT NULL
)
GO

DROP TABLE IF EXISTS [practical_2].[Employee]
GO
CREATE TABLE [practical_2].[Employee] (
	EmployeeId INT PRIMARY KEY IDENTITY,
	EmployeeName VARCHAR(100) NOT NULL,
	DepartmentId INT NOT NULL,
	Experience DECIMAL(5,2) NOT NULL,
	Salary DECIMAL(10,2) NOT NULL
)
GO

-- =====================

--    INSERT DATA

-- =====================

INSERT INTO [practical_2].[Department] ( DepartmentName)
VALUES 
	( 'HR'),
	( 'SALES'),
	( 'DEVELOPER'),
	( 'IT')

INSERT INTO [practical_2].[Employee] ( EmployeeName, DepartmentId, Experience, Salary)
VALUES
	('Abhi',	3,	11,	650000),
	('Bhavin',	3,	1.3,500000),
	('Divyesh',	4,	7,	800000),
	('Niyati',	1,	3,	1000000),
	('Jay',		2,	4.5,950000),
	('Parthiv',	2,	3.6,1000000),
	('Parth',	4,	4.2,650000),
	('Yash',	4,	5.2,650000),
	('Mihir',	2,	12,	650000),
	('Shalish',	2,	8,	650000),
	('Vedant',	3,	7,	650000),
	('Mahek',	3,	6.5,650000),
	('Niraj',	3,	9,	650000),
	('Charmy',	3,	10,	650000)

-- =====================

--		QUERYS

-- =====================


-- 1) Write a Query display empId,EmpName and DepartmentName
SELECT
	EmployeeId empId, 
	EmployeeName EmpName, 
	DepartmentName
FROM
	[practical_2].[Employee] emp
	LEFT JOIN [practical_2].[Department] dept 
		ON emp.DepartmentId = dept.DepartmentId

-- 2) Write a Query to display department wise employee count
SELECT
	dept.DepartmentName,
	ct.employees
FROM
	[practical_2].[Department] dept
	LEFT JOIN (
		SELECT
			DepartmentId, COUNT(*) employees
		FROM
			[practical_2].[Employee]
		GROUP BY
			DepartmentId
		) AS ct
		ON ct.DepartmentId = dept.DepartmentId

-- 3) Write a Query to display department wise maximum salary
SELECT
	DepartmentName, max_salary
FROM
	[practical_2].[Department] dept
	LEFT JOIN (
		SELECT
			DepartmentId, MAX(Salary) max_salary
		FROM
			[practical_2].[Employee]
		GROUP BY
			DepartmentId
		) AS ct
		ON ct.DepartmentId = dept.DepartmentId

-- 4) Write a Query to display employee name in the ascending order of department name
SELECT
	emp.EmployeeName,dept.DepartmentName
FROM
	[practical_2].[Employee] emp
	LEFT JOIN [practical_2].[Department] dept
		ON emp.DepartmentId = dept.DepartmentId
ORDER BY
	dept.DepartmentName

-- 5) Write a Query to display employeeName and grade where grade criteria is as below
-- if employee has more than 10 years of experience then grade is expert
-- if employee has experience between 7 to 10 years then its grade is advanced
-- if employee has experience between 5 to 7 years then its grade is intermediate
-- if employee has experience between 2 to 5 year then its grade is beginner
-- and for the rest of case display grade as novice
SELECT
	EmployeeName,
	CASE 
		WHEN Experience > 10 THEN 'expert'
		WHEN Experience BETWEEN 10 AND 7 THEN 'advance'
		WHEN Experience BETWEEN 7 AND 5 THEN 'intermediate'
		WHEN Experience BETWEEN 5 AND 2 THEN 'beginner'
		ELSE 'novice'
	END
	AS grade
FROM
	[practical_2].[Employee] 
