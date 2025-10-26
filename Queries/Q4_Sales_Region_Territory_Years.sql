/****************************************************
Question 4:
The Management Team wants to analyze sales performance by region and territory over the years 1996-1998.
They asked to provide a report with the following information:

1- Region (Region Name)
2- Territory (Territory Name)
3- The total sales for each year (1996, 1997, 1998)


The report should be based on the following conditions:

The results should be displayed in a pivot format, with years (1996, 1997, 1998) as separate columns.

Finally, order the results by Region and then by Territory in ascending order.

****************************************************/

WITH RegionalSales AS(
	SELECT 
		r.RegionDescription as Region,
		t.TerritoryDescription as Territory,
		YEAR(o.orderdate) AS Year,
		ROUND(SUM(od.Quantity*od.UnitPrice*(1-od.Discount)),2) AS TotalSales
	FROM Region r
	inner join Territories t ON r.RegionID = t.RegionID
	inner join EmployeeTerritories et ON et.TerritoryID = t.TerritoryID
	inner join Employees e ON e.EmployeeID = et.EmployeeID
	inner join Orders o ON o.EmployeeID = e.EmployeeID
	inner join [Order Details] od ON od.OrderID = o.OrderID

	GROUP BY 
		r.RegionDescription, t.TerritoryDescription, YEAR(o.OrderDate)
)

SELECT Region, Territory, [1996] AS Sales1996, [1997] AS Sales1997, [1998] AS Sales1998
FROM Regionalsales

PIVOT
(
    SUM(TotalSales) FOR Year IN ([1996], [1997], [1998])
) AS PivotTable

ORDER BY Region, Territory;