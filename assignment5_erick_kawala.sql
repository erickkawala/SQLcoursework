/*
1. Write a SELECT statement that returns the same result set as this SELECT statement, but don�t use a join. Instead, use a subquery in a WHERE clause that uses the IN keyword.
SELECT DISTINCT CategoryName
FROM Categories c JOIN Products p
  ON c.CategoryID = p.CategoryID
ORDER BY CategoryName
Hint: The original query is returning the category name of  distinct categories that exist on the categories AND products table. The categoryid needs to match on both tables.
To separate into two queries you would create an inner query that selects distinct category ids from the products table.  The outer query should select category name from the categories table.
*/
SELECT CategoryName
FROM Categories
WHERE CategoryID IN
     (SELECT DISTINCT CategoryID FROM Products)
ORDER BY CategoryName;

/*
2. Write a SELECT statement that answers this question: Which products have a list price that�s greater than the average list price for all products?
Return the ProductName and ListPrice columns for each product.
Sort the results by the ListPrice column in descending sequence.
Hint: The inner query should select the average list price from the products table.  In the WHERE clause of the outer query, select the requested columns from the products table. 
*/
SELECT ProductName, ListPrice
FROM Products prod
WHERE ListPrice > (SELECT AVG(ListPrice) FROM Products)
ORDER BY ListPrice DESC;

--3 
/*
Write a SELECT statement that returns the CategoryName column from the Categories table.
Return one row for each category that has never been assigned to any product in the Products table. 
To do that, use a subquery introduced with the NOT EXISTS operator.
The inner query needs to retrieve categories that have been assigned to a product on the products table.
(have a match). Then we�ll use a NOT EXISTS operator to find those that are not in the result set
of the inner query.
Hint: The inner query will select *  from the categories table where categoryID from the products
table is equal to category id on the categories table. 
In the where clause of the outer query, select the requested column from the categories table. 
Create an alias for the categories table to be used in the where clause of the inner query. 
*/

SELECT CategoryName
FROM Categories cust
WHERE NOT EXISTS
    (SELECT *
     FROM Products
     WHERE CategoryID = cust.CategoryID);  

-- activity 4
SELECT EmailAddress, MAX(OrderTotal) AS MaxOrderTotal
FROM
(
  SELECT EmailAddress, ord.OrderID, SUM((ItemPrice - DiscountAmount) * Quantity) AS OrderTotal
  FROM Customers cust
    JOIN Orders ord ON cust.CustomerID = ord.CustomerID
    JOIN OrderItems oi ON ord.OrderID = oi.OrderID
  GROUP BY EmailAddress, ord.OrderID
) temp
GROUP BY EmailAddress;


-- activity 5
SELECT ProductName, DiscountPercent
FROM Products
WHERE DiscountPercent NOT IN (
    SELECT DiscountPercent
    FROM Products
    GROUP BY DiscountPercent
    HAVING count(DiscountPercent) > 1)
ORDER BY ProductName;


-- activity 6
SELECT EmailAddress, OrderID, OrderDate
FROM Customers cust
  JOIN Orders ord ON cust.CustomerID = ord.CustomerID
WHERE OrderDate =
  (SELECT MIN(OrderDate)
   FROM Orders
   WHERE CustomerID = ord.CustomerID)
GROUP BY EmailAddress, OrderID, OrderDate;

