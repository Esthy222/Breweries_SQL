select * from breweries

---What is the total revenue and total profit from all sales?---

SELECT SUM(costs)AS  Total_Revenue,SUM(profiT) AS Total_Profit 
FROM breweries;

---What is the total revenue and profit by year?---
SELECT SUM(costs) AS Revenue_by_year, SUM(profit) AS Profit_by_year, years
FROM breweries
GROUP BY YEARS
ORDER BY YEARS

SELECT to_char(SUM(costs),'FM999,999,999,999') AS Revenue_by_year, to_char(SUM(profit),'FM999,999,999,999') AS Profit_by_year, years
FROM breweries
GROUP BY years
ORDER BY years

SELECT to_char(SUM(costs),'999,999,999,999') AS REVENUE_BY_YEAR, to_char(SUM(profit),'FM999,999,999,999') AS Profit_by_year, years
FROM breweries
GROUP BY years
ORDER BY years


---What is the total quantity and revenue sold by brand?---

SELECT SUM (quantity) AS total_qty_by_brand, SUM (costs) AS total_revenue_by_brand, brands
FROM breweries
GROUP BY brands


select brands,sum(quantity) as tq, sum(costs) as tr from breweries
group by brands
order by tr DESC

----What is the total profit by country?----
SELECT countries, SUM(profit) AS total_profit 
FROM breweries
GROUP BY countries 
ORDER BY total_profit 

---Which sales rep generated the highest total revenue?---

SELECT sales_rep, SUM (costs) AS Total_revenue 
FROM Breweries
GROUP BY sales_rep
ORDER BY Total_revenue DESC
LIMIT 1

---What is the total quantity sold by region and country?---

SELECT region , countries,  SUM(quantity) AS qty_sold 
FROM Breweries
GROUP BY region, countries
ORDER BY qty_sold 

---What is the average unit price for each brand?---
SELECT region, AVG (unit_price) AS average_price , brands
FROM breweries
GROUP BY region, brands
ORDER BY average_price 

----What is the monthly revenue for the year 2019?---
SELECT 
    months,
    SUM(costs) AS total_revenue
FROM breweries
WHERE years = 2019
GROUP BY months
ORDER BY total_revenue;

SELECT months, years, SUM(costs) AS monthly_revenue_2019
FROM breweries
WHERE years = 2019
GROUP BY months, years
ORDER BY years

----For each brand, which year had the highest revenue----
SELECT brands, years, SUM(costs) AS highest_revenue
FROM breweries
GROUP BY brands, years
ORDER BY highest_revenue DESC
LIMIT 1 



SELECT brands, years, SUM(costs) AS highest_revenue
FROM breweries
where Years = 2019
GROUP BY brands, years
ORDER BY highest_revenue DESC
LIMIT 1 


---Which transactions have a profit margin greater than 30%? Profit margin = PROFIT /COSTS---


SELECT brands , (SUM(profit)/SUM(costs))*100 AS profit_margin
FROM breweries
GROUP BY brands
HAVING (SUM(profit)/SUM (costs))*100 > 30

---What is the total revenue by brand and country combination?---

SELECT brands, countries, SUM(costs) AS total_revenue
FROM breweries
GROUP BY brands, countries

----How many sales records does each sales rep have?---
SELECT sales_rep, COUNT(*) AS number_of_sales 
FROM breweries
GROUP BY sales_rep
ORDER BY number_of_sales 



----For each region, which brand generated the highest profit---
SELECT region, brands, SUM(profit) AS highest_profit
FROM breweries
GROUP BY region, brands
ORDER BY highest_profit DESC

