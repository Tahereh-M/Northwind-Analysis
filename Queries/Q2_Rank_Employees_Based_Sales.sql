/******************************************************************
Question 2: 
Rank employees based on their total sales

You've been asked to provide a list with the following information:
 1- Employee's Name(FirstName + LastName)
 2- Shipper Name (Shipper company name)
 3- Year of sale 
 4- Total Sales (with 2 decimal places)
 5- Sales Rank 

 Filters:
 1- Remove invalid records

 Sort the results by year and rank.
******************************************************************/

WITH EmployeeSales AS (
	SELECT 
		E.FirstName + ' ' + E.LastName as EmployeeName, 
		sh.CompanyName as ShipperName, 
		YEAR(o.orderdate) as Year, 
		SUM(od.UnitPrice*od.Quantity*(1-Discount)) as TotalSales
	FROM Orders o
	inner join [Order Details] od on od.OrderId = o.OrderID
	inner join Employees e on e.EmployeeID = o.EmployeeID
	inner join Shippers sh on sh.ShipperID = o. ShipVia
	GROUP BY E.EmployeeID, E.FirstName, e.LastName, sh.CompanyName, YEAR(o.OrderDate)
)

SELECT 
	EmployeeName,
	ShipperName,
	Year,
	ROUND(TotalSales, 2) AS TotalSales,
	RANK() OVER (PARTITION BY Year ORDER BY TotalSales DESC) AS SalesRank
FROM EmployeeSales
WHERE 
    TotalSales > 0 
ORDER BY Year DESC, SalesRank;