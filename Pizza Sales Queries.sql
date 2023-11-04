USE pizza;

SELECT 
    *
FROM
    pizza_sales;


-- Total Revenue
SELECT 
    SUM(total_price) AS Total_Revenue
FROM
    pizza_sales;


-- Average Order Value
SELECT 
    SUM(total_price) / COUNT(DISTINCT (order_id)) AS Avg_Order_Value
FROM
    pizza_sales;


-- Total Pizza Sold
SELECT 
    SUM(quantity) AS Total_Pizza_Sold
FROM
    pizza_sales;


-- Total Orders
SELECT 
    COUNT(DISTINCT (order_id)) AS Total_Orders
FROM
    pizza_sales;


-- Average Pizza Per Order
SELECT 
    CAST(SUM(quantity) / COUNT(DISTINCT (order_id))
        AS DECIMAL (10 , 2 )) AS Avg_Pizzas_Per_Order
FROM
    pizza_sales;


-- Daily Trend for Total Order
SELECT 
    DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Order_day,
    COUNT(DISTINCT (order_id)) AS Total_Orders
FROM
    pizza_sales
GROUP BY Order_day;


-- Monthly Trend for Total Order
SELECT 
    MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Month,
    COUNT(DISTINCT (order_id)) AS Total_Orders
FROM
    pizza_sales
GROUP BY Month;


-- -- Percentage of Sales by Pizza Category
SELECT 
    pizza_category AS Caterogry,
    ROUND((100 * (SUM(total_price)) / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales)),
            2) AS Percent
FROM
    pizza_sales
GROUP BY pizza_category;


-- Percentage of Sales by Pizza Size
SELECT 
    pizza_size AS Size,
    ROUND((100 * (SUM(total_price)) / (SELECT 
                    SUM(total_price)
                FROM
                    pizza_sales)),
            2) AS Percent
FROM
    pizza_sales
GROUP BY Size;


-- Total Pizza Sold by Pizza Category
SELECT 
    pizza_category AS Category, SUM(quantity) AS Sold_Pizzas
FROM
    pizza_sales
GROUP BY Category;


-- Top 5 Best Seller by Total Revenue
SELECT 
    pizza_name AS Pizza, SUM(total_price) AS Total_Revenue
FROM
    pizza_sales
GROUP BY Pizza
ORDER BY Total_Revenue DESC
LIMIT 5;


-- Top 5 Best Seller by Total Quantity
SELECT 
    pizza_name AS Pizza, SUM(quantity) AS Total_Quantity
FROM
    pizza_sales
GROUP BY Pizza
ORDER BY Total_Quantity DESC
LIMIT 5;


-- Top 5 Best Seller by Total Orders
SELECT 
    pizza_name AS Pizza,
    COUNT(DISTINCT (order_id)) AS Total_Order
FROM
    pizza_sales
GROUP BY Pizza
ORDER BY Total_Order DESC
LIMIT 5;


-- Bottom 5 Best Seller by Total Revenue
SELECT 
    pizza_name AS Pizza, SUM(total_price) AS Total_Revenue
FROM
    pizza_sales
GROUP BY Pizza
ORDER BY Total_Revenue ASC
LIMIT 5;


-- Bottom 5 Best Seller by Total Quantity
SELECT 
    pizza_name AS Pizza, SUM(quantity) AS Total_Quantity
FROM
    pizza_sales
GROUP BY Pizza
ORDER BY Total_Quantity ASC
LIMIT 5;


-- Bottom 5 Best Seller by Total Order
SELECT 
    pizza_name AS Pizza,
    COUNT(DISTINCT (Order_id)) AS Total_Order
FROM
    pizza_sales
GROUP BY Pizza
ORDER BY Total_Order ASC
LIMIT 5;

-- Use WHERE Clause for Filers like
SELECT 
    pizza_name AS Pizza,
    COUNT(DISTINCT (Order_id)) AS Total_Order
FROM
    pizza_sales
WHERE
    pizza_category = 'Classic'
GROUP BY Pizza
ORDER BY Total_Order ASC
LIMIT 5;