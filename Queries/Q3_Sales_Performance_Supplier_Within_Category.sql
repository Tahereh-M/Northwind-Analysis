/************************************************************************
Question 3: 
The Marketing Team wants to analyze the sales performance of suppliers within each product category. 
They asked to provide a list with the following information:

1- Category name
2- Supplier name
3- Supplier country
4- Their total revenue(rounded to 2 decimals)
5- Their total quantity sold
6- The average revenue per category (rounded to 2 decimals)

The list should be filtered by the following condition:

The supplier’s total revenue must be greater than the overall average revenue (calculated across all suppliers and categories).

Finally, order the results by total revenue in descending order.
*************************************************************************/

WITH CategorySales AS (
    SELECT 
        cat.CategoryName,
        s.CompanyName AS SupplierName,
        s.Country AS SupplierCountry,
        round(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS TotalRevenue,
        SUM(od.Quantity) AS TotalQuantity
    FROM 
        Categories cat
        INNER JOIN Products p ON cat.CategoryID = p.CategoryID
        INNER JOIN [Order Details] od ON p.ProductID = od.ProductID
        INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
    GROUP BY 
        cat.CategoryID, cat.CategoryName, s.CompanyName, s.Country
)
SELECT 
    CategoryName,
    SupplierName,
    SupplierCountry,
    TotalRevenue,
    TotalQuantity,
    (SELECT ROUND(AVG(TotalRevenue),2) 
	FROM CategorySales sub 
	WHERE sub.CategoryName = cs.CategoryName) AS AvgCategoryRevenue
FROM 
    CategorySales cs
WHERE 
    TotalRevenue > (SELECT AVG(TotalRevenue) FROM CategorySales)    
ORDER BY 
    TotalRevenue DESC;
