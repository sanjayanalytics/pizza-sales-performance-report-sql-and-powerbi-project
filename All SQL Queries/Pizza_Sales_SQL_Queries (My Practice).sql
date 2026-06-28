CREATE TABLE pizza_sales
(pizza_id       INT PRIMARY KEY,
order_id        INT,
pizza_name_id   VARCHAR(50),
quantity        INT,
order_date      DATE,
order_time      TIME,
unit_price      NUMERIC(10,2),
total_price     NUMERIC(10,2),
pizza_size      VARCHAR(10),
pizza_category  VARCHAR(20),
pizza_name      VARCHAR(100),
pizza_ingredients  TEXT
);

SELECT * FROM pizza_sales;

--KPI
--1.Total Revenue
SELECT SUM(total_price) AS Total_Revenue
FROM pizza_sales;

--2.Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales;

--3.Average Order Value
SELECT CAST(CAST(SUM(total_price) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Order_Value
FROM pizza_sales;

--4. Total Pizzas Sold

SELECT SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales;

--5. Average Pizzas Per Order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2))/
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizza_per_Order
FROM pizza_sales;


SELECT * FROM pizza_sales;

--Analysis
--1.Monthly Trend for Total Revenue
SELECT TO_CHAR(order_date, 'Month') AS Month, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY TO_CHAR(order_date, 'Month')
ORDER BY Total_Revenue DESC;

--2.Daily Trend for Total Orders

SELECT TO_CHAR(order_date, 'Day') AS Day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY TO_CHAR(order_date, 'Day')
ORDER BY Total_Orders DESC;

--3.Percentage of Sales by Pizza Category

SELECT pizza_category, SUM(total_price) AS Total_Revenue, CAST(CAST(SUM(total_price) AS DECIMAL(10,2))*100/
CAST((SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Revenue_PCT
FROM pizza_sales
GROUP BY pizza_category; 

--4.Percentage of Sales by Pizza Size

SELECT pizza_size, SUM(total_price) AS Total_Revenue, CAST(CAST(SUM(total_price) AS DECIMAL(10,2))*100/
CAST((SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Revenue_PCT
FROM pizza_sales
GROUP BY pizza_size;

SELECT * FROM pizza_sales;

--5. Total Pizzas Sold by Pizza Size
SELECT pizza_size, SUM(quantity) AS Total_pizza_Sold
FROM pizza_sales
GROUP BY pizza_size;

--6. Total Pizzas Sold by Pizza Category
SELECT pizza_category, SUM(quantity) AS Total_pizza_Sold
FROM pizza_sales
GROUP BY pizza_category;

--Top & Bottom Analysis


--1.Top 5 Pizza by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

--2.Bottom 5 Pizza by Revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue 
LIMIT 5;

--3.Top 5 Pizzas by Orders

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

--4.Bottom 5 Pizzas by Orders
SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders
LIMIT 5;

--5.Top 5 Pizzas by Quantity Sold

SELECT pizza_name, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold DESC
LIMIT 5;

--6.Bottom 5 Pizzas by Quantity Sold

SELECT pizza_name, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity_Sold 
LIMIT 5;


























