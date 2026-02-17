-- 1. Total Revenue
SELECT SUM(Amount) AS Total_Revenue
FROM ecommerce_data;

-- 2. Total Profit
SELECT SUM(Profit) AS Total_Profit
FROM ecommerce_data;

-- 3. Revenue by Category
SELECT Category,
       SUM(Amount) AS Revenue
FROM ecommerce_data
GROUP BY Category
ORDER BY Revenue DESC;

-- 4. Profit by Sub-Category
SELECT Sub_Category,
       SUM(Profit) AS Total_Profit
FROM ecommerce_data
GROUP BY Sub_Category
ORDER BY Total_Profit DESC;

-- 5. Monthly Revenue Trend
SELECT Year,
       Month,
       SUM(Amount) AS Monthly_Revenue
FROM ecommerce_data
GROUP BY Year, Month
ORDER BY Year, Month;

-- 6. Top 5 States by Revenue
SELECT State,
       SUM(Amount) AS Revenue
FROM ecommerce_data
GROUP BY State
ORDER BY Revenue DESC
LIMIT 5;

-- 7. Payment Mode Distribution
SELECT Payment_Mode,
       COUNT(Order_ID) AS Total_Orders
FROM ecommerce_data
GROUP BY Payment_Mode
ORDER BY Total_Orders DESC;

-- 8. Average Order Value
SELECT AVG(Amount) AS Avg_Order_Value
FROM ecommerce_data;

-- 9. Profit Margin by Category
SELECT Category,
       ROUND((SUM(Profit)/SUM(Amount))*100,2) AS Profit_Margin_Percentage
FROM ecommerce_data
GROUP BY Category
ORDER BY Profit_Margin_Percentage DESC;

-- 10. Loss-Making Products
SELECT Sub_Category,
       SUM(Profit) AS Total_Profit
FROM ecommerce_data
GROUP BY Sub_Category
HAVING SUM(Profit) < 0
ORDER BY Total_Profit;
