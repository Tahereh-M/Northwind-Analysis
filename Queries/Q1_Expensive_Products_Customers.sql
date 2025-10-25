/**************************************************************
Question 1:
The marketing team wants to analyze customers who purchased expensive products.

The marketing team wants to identify customers who bought high-priced products for targeted campaigns.
You've been asked to provide a list with the following information:

1- Customer company name (CompanyName)
2- Number of products purchased with unit price above $30 (Total Expensive Products)
3- Average order value (Average Order Value, with 2 decimal places)

Filters:

1- Products should not be discontinued.
2- The number of products purchased should be more than 3.

Sort the results by average order value in descending order.
**************************************************************/

SELECT 
	c.CompanyName ,
	YEAR(o.OrderDate) AS OrderYear,
	COUNT(DISTINCT od.ProductID) AS TotalExpensiveProducts,
	ROUND(SUM(OD.Quantity * OD.UnitPrice * (1 - OD.Discount)) / COUNT(DISTINCT O.OrderID),2) AS AverageOrderValue	
FROM Customers c
inner join orders o ON c.CustomerID = o.CustomerID
inner join [Order Details] od ON o.OrderID = od.OrderID
inner join Products p ON p.ProductID = od.ProductID
WHERE od.UnitPrice > 30 and
p.Discontinued =0
GROUP BY c.companyname, YEAR(o.OrderDate)
HAVING COUNT(DISTINCT od.ProductID) > 3
ORDER BY AverageOrderValue DESC;