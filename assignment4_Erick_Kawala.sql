
--1.      Write a SELECT statement that 
-- joins the Categories table to the Products 
--table and returns these columns: 
--		CategoryName, ProductName, ListPrice.
--Sort the result set by CategoryName 
-- and then by ProductName in ascending order.

USE MyGuitarShop;

-- Activity 1
SELECT CategoryName, ProductName, ListPrice
FROM Categories cats
INNER JOIN Products prods
ON cats.CategoryID = prods.CategoryID
ORDER BY CategoryName, ProductName;

-- Activity 2
-- 2.      Write a SELECT statement that joins
--		the Customers table to the Addresses table
--		and returns these columns: FirstName, LastName,
--							Line1, City, State, ZipCode.
-- Only return rows for the customer(s) 
-- with an email address of allan.sherwood@yahoo.com.
SELECT FirstName, LastName, Line1, City, State, Zipcode
--, Line1, City, State, Zipcode
FROM Customers cus
INNER JOIN Addresses addrs
ON cus.CustomerID = addrs.CustomerID
WHERE cus.EmailAddress = 'allan.sherwood@yahoo.com'


/* 3.      Write a SELECT statement that joins the Customers
-- table to the Addresses table and returns these 
-- columns: FirstName, LastName, Line1, City, State, ZipCode.
-- Return one row for each customer match on both tables and 
-- each address match on both tables. */
SELECT DISTINCT FirstName, LastName, Line1, City, State, Zipcode  -- need to use TOP or Distinct to return one row per match?
FROM Customers cus
INNER JOIN Addresses addrs
ON cus.CustomerID = addrs.CustomerID 
AND cus.ShippingAddressID = addrs.AddressID

/*
4.      Write a SELECT statement that joins 
the Customers, Orders, OrderItems, and Products tables. 

This statement should return these columns:
LastName, FirstName, OrderDate, ProductName, ItemPrice,
	DiscountAmount, and Quantity.

Use aliases for the tables.
Sort the final result set by LastName, OrderDate, and ProductName.
*/
SELECT LastName, FirstName, OrderDate, ProductName, ItemPrice,
				DiscountAmount, Quantity
FROM Customers cus
	JOIN Orders ord on ord.CustomerID = cus.CustomerID
	JOIN OrderItems oi on ord.OrderID = oi.OrderID 
	JOIN Products prod on oi.ProductID = prod.ProductID
	ORDER BY LastName, OrderDate, ProductName


/*
6.      Write a SELECT statement that returns these two columns:
CategoryName          	The CategoryName column from the Categories table
ProductID                 	The ProductID column from the Products table
Return one row for each category that has never been used. (Hint: Use a left outer join.
Join on categoryID and only return rows where the ProductID column has a null value.)
*/
SELECT CategoryName, ProductID
FROM Categories cat
LEFT OUTER JOIN Products prod on cat.CategoryID = prod.CategoryID
WHERE prod.ProductID is NULL



/*
7.      Use the UNION operator to generate a result set consisting of three columns from the Orders table:
ShipStatus          	A calculated column that contains a value of SHIPPED or NOT SHIPPED
OrderID              	The OrderID column
OrderDate           	The OrderDate column
If the order has a value in the ShipDate column, the ShipStatus column should contain a value of SHIPPED.
Otherwise, it should contain a value of NOT SHIPPED.
Sort the final result set by OrderDate.
*/
	SELECT 'NOT SHIPPED' AS ShipStatus, OrderDate, OrderID
	FROM ORDERS
	WHERE OrderDate is NULL
UNION
	SELECT 'SHIPPED' AS ShipStatus, OrderDate, OrderID
	FROM ORDERS
	WHERE OrderDate is NOT NULL
	
	ORDER BY OrderDate;
/*
Solution:
SELECT 'UNDERGRAD' AS Status, FirstName, LastName, EnrollmentDate, GraduationDate
FROM Students
WHERE GraduationDate IS NULL

UNION

SELECT 'GRADUATED' AS Status, FirstName, LastName, EnrollmentDate, GraduationDate
FROM Students
WHERE GraduationDate IS NOT NULL

ORDER BY EnrollmentDate; */