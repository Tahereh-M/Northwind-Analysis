/********************************************************
Question 5:
The Operations Team wants to evaluate delivery performance in terms of shipment delays. 
They asked you to provide a report with the following information:

1- Shipper name
2- Employee name
3- Delay category for each order, defined as:
	On Time → when ShippedDate <= RequiredDate
	Minor Delay → when the shipment delay is between 1 and 3 days
	Major Delay → when the shipment delay is greater than 3 days

4- The average delay days (only for orders with an average delay > 0 days)
5- The total number of orders
6- A ranking of employees within each shipper based on their average delay

Finally, order the results by Shipper name and then by delay rank.
**********************************************************/

WITH OrderDelays AS(
	SELECT 
		o.OrderID,
		sh.CompanyName as ShipperName,
		e.FirstName + ' ' + e.LastName as EmployeeName,
		DATEDIFF(DAY,o.RequiredDate, o.ShippedDate) as DelayDays,
		CASE
			WHEN DATEDIFF(DAY,o.RequiredDate, o.ShippedDate) <= 0 THEN 'On Time'
			WHEN DATEDIFF(DAY,o.RequiredDate, o.ShippedDate) BETWEEN 1 AND 3 THEN 'Minor Delay'
			ELSE 'Major Delay'
		END AS DelayCategory
	
	FROM Shippers sh
	INNER JOIN Orders o ON o.ShipVia = sh.ShipperID
	INNER JOIN Employees e ON e.EmployeeID = o.EmployeeID
)

SELECT 
	ShipperName,
	EmployeeName,
	DelayCategory,
	AVG(DelayDays) as AvgDelay,
	count(orderid) as NumberOfOrders,
	ROW_NUMBER() OVER(PARTITION BY ShipperName ORDER BY AVG(DelayDays) DESC) AS DelayRank
FROM
	OrderDelays
GROUP BY
	ShipperName, EmployeeName,	DelayCategory
HAVING 
    AVG(DelayDays) > 0
ORDER BY 
    ShipperName, DelayRank;