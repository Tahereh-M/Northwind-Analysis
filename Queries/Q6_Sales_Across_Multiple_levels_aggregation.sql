/***********************************************************
Question 6:
The Sales Team wants to analyze sales performance across multiple levels of aggregation. 
They asked you to prepare a report that provides:

1- Total Revenue for each supplier by product category and country.
2- Subtotals for each supplier (across all categories).
3- Subtotals for each country (across all suppliers).
4- A grand total of sales across all suppliers and countries.
5- Additionally, display the overall company revenue on every row for reference.

Finally, order the results by country and then by supplier name.
*************************************************************/

WITH TotalOrderRevenue AS (
    SELECT ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)),2) AS OverallRevenue
    FROM [Order Details] od
)
SELECT 
    s.CompanyName AS SupplierName,
    s.Country AS SupplierCountry,
    cat.CategoryName,
    ROUND(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 2) AS TotalRevenue,
    (SELECT OverallRevenue FROM TotalOrderRevenue) AS OverallRevenue,
	CASE 
        WHEN GROUPING(s.CompanyName) = 0 AND GROUPING(s.Country) = 0 AND GROUPING(cat.CategoryName) = 0 THEN 'Supplier + Country + Category'
        WHEN GROUPING(s.CompanyName) = 0 AND GROUPING(s.Country) = 0 AND GROUPING(cat.CategoryName) = 1 THEN 'Supplier + Country'
        WHEN GROUPING(s.CompanyName) = 1 AND GROUPING(s.Country) = 0 AND GROUPING(cat.CategoryName) = 1 THEN 'Country'
        WHEN GROUPING(s.CompanyName) = 1 AND GROUPING(s.Country) = 1 AND GROUPING(cat.CategoryName) = 1 THEN 'Grand Total'
    END AS GroupLevel
FROM 
    Suppliers s
    INNER JOIN Products p 
        ON s.SupplierID = p.SupplierID
    INNER JOIN Categories cat 
        ON p.CategoryID = cat.CategoryID
    INNER JOIN [Order Details] od 
        ON p.ProductID = od.ProductID
GROUP BY GROUPING SETS (
    (s.CompanyName, s.Country, cat.CategoryName),  
    (s.CompanyName, s.Country),                   
    (s.Country),                                  
    ()                                           
)
ORDER BY 
	s.Country, 
    s.CompanyName;