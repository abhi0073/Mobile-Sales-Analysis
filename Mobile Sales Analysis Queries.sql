CREATE DATABASE MOBILE_SALES;

USE MOBILE_SALES;

/* || 1) TOTAL SALES || */
          
SELECT FORMAT(SUM(`Total Sales`), "#,##") AS TOTAL_SALES
FROM `mobile sales data`;

/* || 2) TOTAL QUANTITY || */
          
SELECT FORMAT(SUM(`Units Sold`), "#,##") AS TOTAL_QUANTITY
FROM `mobile sales data`;

/* || 3) TRANSACTIONS || */
          
SELECT FORMAT(COUNT(`﻿Transaction ID`), "#,##") AS TRANSACTIONS
FROM `mobile sales data`;

/* || 4) AVERAGE RATING || */
          
SELECT ROUND(AVG(`Customer Ratings`),2) AS AVG_RATINGS
FROM `mobile sales data`;

/* || 5) TOTAL SALES BY CITY || */

SELECT `City` AS CITY, FORMAT(SUM(`Total Sales`), "#,##") AS TOTAL_SALES
FROM `mobile sales data`
GROUP BY CITY
ORDER BY TOTAL_SALES DESC;

/* || 6) TOTAL QUANTITY BY MONTH NAME || */
          
SELECT `MonthName` AS MONTHNAME, FORMAT(SUM(`Units Sold`), "#,##") AS TOTAL_QUANTITY
FROM `mobile sales data`
GROUP BY MONTHNAME
ORDER BY TOTAL_QUANTITY DESC;

/* || 7) BRAND WISE TOTAL SALES AND TRANSACTION || */
          
SELECT `Brand` AS BRAND, FORMAT(SUM(`Total Sales`), "#,##") AS TOTAL_SALES,
COUNT(`﻿Transaction ID`) AS TRANSACTIONS
FROM `mobile sales data`
GROUP BY BRAND
ORDER BY TOTAL_SALES DESC;

/* || 8) RATINGS BY RATING STATUS || */
          
SELECT 
     CASE
		 WHEN `Customer Ratings` >= 4 THEN "GOOD"
         WHEN `Customer Ratings` > 2 THEN "AVERAGE"
         WHEN `Customer Ratings` >= 1 THEN "POOR"
	 END AS RATING_STATUS, COUNT(`Customer Ratings`) AS TOTAL_RATINGS
FROM `mobile sales data`
GROUP BY RATING_STATUS;

/* || 9) TRANSACTION BY PAYMENT METHOD || */
          
SELECT `Payment Method` AS PAYMENT_METHOD, COUNT(`﻿Transaction ID`) AS TRANSACTIONS
FROM `mobile sales data`
GROUP BY PAYMENT_METHOD
ORDER BY TRANSACTIONS DESC;

/* || 10) TOP 5 TOTAL SALES BY MOBILE MODEL || */
          
SELECT `Mobile Model` AS MOBILE_MODEL, FORMAT(SUM(`Total Sales`), "#,##") AS TOTAL_SALES
FROM `mobile sales data`
GROUP BY MOBILE_MODEL
ORDER BY TOTAL_SALES DESC
LIMIT 5;

/* || 11) TOTAL SALES BY DAY NAME || */
          
SELECT `Day Name` AS DAY_NAME, FORMAT(SUM(`Total Sales`), "#,##") AS TOTAL_SALES
FROM `mobile sales data`
GROUP BY DAY_NAME
ORDER BY TOTAL_SALES DESC;

/* || 12) WAQTD MOBILE MODEL, BRAND, QUANTITY, SALES WHERE BARND IS SAMSUNG AND ONEPLUS || */
          
SELECT `Mobile Model` AS MOBILE_MODEL, `Brand` AS BRAND,
SUM(`Units Sold`) AS QUANTITY, FORMAT(SUM(`Total Sales`), "#,##") AS SALES
FROM `mobile sales data`
WHERE `Brand` IN("SAMSUNG","ONEPLUS")
GROUP BY MOBILE_MODEL, BRAND
ORDER BY SALES DESC;

/* || 13) YEAR, MONTH, DAY BY SALES || */

SELECT `Year` AS YEAR1, `MonthName` AS MONTH1, `Day` AS DAY1,
FORMAT(SUM(`Total Sales`), "#,##") AS SALES
FROM `mobile sales data`
GROUP BY YEAR1, MONTH1, DAY1;

/* || 14) WAQTD YEAR, MONTH, QUANTITY, SALES WHERE YEAR IS 2022 AND 2024 || */

SELECT `Year` AS YEARS, `MonthName` AS MONTHS, FORMAT(SUM(`Units Sold`), "#,##") AS QUANTITY,
FORMAT(SUM(`Total Sales`), "#,##") AS SALES
FROM `mobile sales data`
WHERE `Year` IN(2022,2024)
GROUP BY YEARS, MONTHS;

/* || 15) YEAR, MONTH, SALES, SAME PERIOD LAST YEAR || */

SELECT `Year`AS YEARS, `MonthName` AS MONTHS, FORMAT(SUM(`Total Sales`), "#,##") AS SALES,
LAG(FORMAT(SUM(`Total Sales`), "#,##"),12) OVER (ORDER BY `Year`) AS SAME_PERIOD_LAST_YEAR
FROM `mobile sales data`
GROUP BY YEARS, MONTHS;

/* || 16) TOTAL SALES AND SAME PERIOD LAST YEAR BY YEAR || */

SELECT `Year` AS YEARS, FORMAT(SUM(`Total Sales`), "#,##") AS SALES,
LAG(FORMAT(SUM(`Total Sales`), "#,##")) OVER (ORDER BY `Year`) AS SAME_PERIOD_LAST_YEAR
FROM `mobile sales data`
GROUP BY YEARS;
