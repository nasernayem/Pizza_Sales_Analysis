SELECT * FROM pizza_sales

-- Total Revenue
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

--Average Order Value
SELECT SUM(total_price)/COUNT(DISTINCT(order_id)) AS Avarage_Order_Value FROM pizza_sales

--Total Pizza Sold
SELECT SUM(quantity) AS Total_Pizza_Sold FROM pizza_sales

--Total Orders
SELECT COUNT(DISTINCT(order_id)) AS Total_Order FROM pizza_sales

--Average Pizzas Per Order
SELECT SUM(quantity)/COUNT(DISTINCT(order_id)) AS Average_Pizzas_Per_Order FROM pizza_sales
--Daily Trend for Total Orders
SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders 
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
--Hourly Trend for Total Orders
SELECT DATEPART(HOUR, order_time) AS Order_Time , COUNT(DISTINCT(order_id)) AS Total_Orders FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

--Percentage of Sales by Pizza Category
SELECT pizza_category, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS Percentage_of_sales  FROM pizza_sales
GROUP BY pizza_category

--Percentage of Sales by Pizza Size
SELECT pizza_size, ROUND(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales),2) AS Percentage_of_sales  FROM pizza_sales
GROUP BY pizza_size

--Total Pizzas Sold by Pizza Category
SELECT pizza_category, Round(SUM(total_price),2) AS Sum_of_Sales  FROM pizza_sales
GROUP BY pizza_category

--Top 5 Best Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizza_sold DESC

--Bottom 5 Worst Sellers by Total Pizzas Sold
SELECT TOP 5 pizza_name, SUM(quantity) AS total_pizza_sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY total_pizza_sold ASC