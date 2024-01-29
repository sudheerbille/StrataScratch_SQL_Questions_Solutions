## Cities With The Most Expensive Homes - ID 10315 ##

Question:
Write a query that identifies cities with higher than average home prices when compared to the national average. Output the city names.

Table: zillow_transactions

Table Structure:
id: int
state: varchar
city: varchar
street_address: varchar
mkt_price: int

Solution:
WITH CTE AS 
(SELECT CITY, 
       AVG(MKT_PRICE) AS AVG_MKT_PRICE
FROM zillow_transactions
GROUP BY 1
HAVING AVG(MKT_PRICE) > (SELECT AVG(MKT_PRICE) FROM zillow_transactions)
)

SELECT CITY FROM CTE;
