-- To view table
SELECT *
FROM [dbo].[Cleaned$]

-- Total Revenue
SELECT SUM(TotalPrice) as Total_Revenue
FROM [dbo].[Cleaned$]

--Total Orders
SELECT COUNT(OrderID) as Total_Orders
FROM [dbo].[Cleaned$]

--Average Order Value
SELECT ROUND(AVG(TotalPrice),2) as Average_Order_Value
FROM [dbo].[Cleaned$]


-- Payment Preferences
SELECT
    PaymentMethod,
    COUNT(*) AS TotalTransactions
FROM [dbo].[Cleaned$]
GROUP BY PaymentMethod
ORDER BY TotalTransactions DESC;

-- Which product generates high sales revenue
SELECT
    Product,
    SUM(TotalPrice) AS Revenue
FROM [dbo].[Cleaned$]
GROUP BY Product
ORDER BY Revenue DESC;


--Revenue trend over time
SELECT
	DATENAME(Month, Date) AS Month,
	ROUND(SUM(TotalPrice), 2) AS Total_Revenue
FROM [dbo].[Cleaned$]
GROUP BY DATENAME(Month, Date)
ORDER BY Total_Revenue DESC;

--percentage measure(orders cancelled, delivered, pending, returned or shipped)
SELECT
    OrderStatus,
    COUNT(*) AS Orders,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (),
        2
    ) AS Percentage
FROM [dbo].[Cleaned$]
GROUP BY OrderStatus
ORDER BY Percentage DESC;

--Top 10 customer
SELECT top 10
    CustomerID,
    SUM(TotalPrice) AS Revenue
FROM [dbo].[Cleaned$]
GROUP BY CustomerID
ORDER BY Revenue DESC;

--Which referral source generates the highest sales revenue?
SELECT
    ReferralSource,
    SUM(TotalPrice) AS Revenue
FROM [dbo].[Cleaned$]
GROUP BY ReferralSource
ORDER BY Revenue DESC;