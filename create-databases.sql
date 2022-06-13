DROP DATABASE IF EXISTS `sql_sale_tax`;
CREATE DATABASE `sql_sales_tax`; 
USE `sql_sales_tax`;

-- Creating table for 1Q20 sales tax rate by city and county
CREATE TABLE twenty (
	City VARCHAR(80) NOT NULL,
	Rate DECIMAL (5,5) NOT NULL,
	County VARCHAR(20) NOT NULL,
	PRIMARY KEY (City, County)
);

SELECT * FROM twenty;

-- Creating table for 1Q21 sales tax rate by city and county
CREATE TABLE twentyone (
	City VARCHAR(80) NOT NULL,
	Rate DECIMAL (5,5) NOT NULL,
	County VARCHAR(20) NOT NULL,
	PRIMARY KEY (City, County)
);

SELECT * FROM twentyone;

-- Creating table for 1Q22 sales tax rate by city and county
CREATE TABLE twentytwo (
	City VARCHAR(80) NOT NULL,
	Rate DECIMAL(5,5) NOT NULL,
	County VARCHAR(20) NOT NULL,
	PRIMARY KEY (City, County)
);

SELECT * FROM twentytwo;

-- Combine tables into one
CREATE TABLE SalesTaxInfo (
year INTEGER,
city VARCHAR(80) NOT NULL,
county VARCHAR(40) NOT NULL,
rate DECIMAL (5,5) NOT NULL
);


INSERT INTO SalesTaxInfo (year, city, county, rate)
SELECT 2020, city, county, rate FROM twenty;

INSERT INTO SalesTaxInfo (year, city, county, rate)
SELECT 2021, city, county, rate FROM twentyone;

INSERT INTO SalesTaxInfo (year, city, county, rate)
SELECT 2022, city, county, rate FROM twentytwo;

SELECT * FROM SalesTaxInfo;

CREATE TABLE SalesTaxByYear (
year INTEGER,
city VARCHAR(80) NOT NULL,
county VARCHAR(40) NOT NULL,
rate DECIMAL (5,5) NOT NULL
);

INSERT INTO SalesTaxByYear
SELECT year,
	city,
	county,
	rate 
FROM SalesTaxInfo
ORDER BY city, county, year;

SELECT * FROM SalesTaxByYear;


