-- 1. Monthly Revenue Trend
SELECT 
    FORMAT(Order_Date, 'yyyy-MM') AS Month,
    SUM(Total_Amount) AS Monthly_Revenue,
    COUNT(Order_ID) AS Total_Orders
FROM Fact_Sales
GROUP BY FORMAT(Order_Date, 'yyyy-MM')
ORDER BY Month;

-- 2. Top 5 Selling Products
SELECT TOP 5
    p.Product_Name,
    SUM(s.Quantity) AS Total_Quantity_Sold,
    SUM(s.Total_Amount) AS Total_Revenue
FROM Dim_Product p
JOIN Fact_Sales s ON p.Product_Key = s.Product_Key
GROUP BY p.Product_Name
ORDER BY Total_Revenue DESC;
