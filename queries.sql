-- Query 1: Preview first 10 rows of the table
SELECT * FROM ecommerce
LIMIT 10;
-- Query 2: Female customers only
SELECT * 
FROM ecommerce
WHERE Gender = 'Female';

-- Query 3: Female customers aged 25-45
SELECT * 
FROM ecommerce
WHERE Gender = 'Female' AND AgeGroup = '25-45';

-- Query 4: Transactions sorted by NetAmount descending
SELECT * 
FROM ecommerce
ORDER BY NetAmount DESC;

-- Query 5: Total NetAmount by ProductCategory
SELECT ProductCategory, SUM(NetAmount) AS TotalNetSales
FROM ecommerce
GROUP BY ProductCategory
ORDER BY TotalNetSales DESC;

-- Query 6: Average NetAmount by AgeGroup
SELECT AgeGroup, AVG(NetAmount) AS AvgNet
FROM ecommerce
GROUP BY AgeGroup;

-- Query 7: Count of transactions with discount
SELECT DiscountAvailed, COUNT(*) AS NumberOfTransactions
FROM ecommerce
GROUP BY DiscountAvailed;

-- Query 8: Customers spending above average
SELECT CID, NetAmount
FROM ecommerce
WHERE NetAmount > (SELECT AVG(NetAmount) FROM ecommerce);

-- Query 9: Total NetAmount per Location
SELECT Location, SUM(NetAmount) AS TotalSales
FROM ecommerce
GROUP BY Location
ORDER BY TotalSales DESC;

-- Query 10: Top 5 customers by total NetAmount
SELECT CID, SUM(NetAmount) AS TotalSpent
FROM ecommerce
GROUP BY CID
ORDER BY TotalSpent DESC
LIMIT 5;

-- Query 11: Sales of products where discount was applied
SELECT ProductCategory, SUM(NetAmount) AS TotalSales
FROM ecommerce
WHERE DiscountAvailed = 'Yes'
GROUP BY ProductCategory;

-- Query 12: Monthly sales trend (PurchaseDate format YYYY-MM-DD)
SELECT substr(PurchaseDate,1,7) AS YearMonth, SUM(NetAmount) AS MonthlySales
FROM ecommerce
GROUP BY YearMonth
ORDER BY YearMonth;