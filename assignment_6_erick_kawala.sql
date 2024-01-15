Use MyGuitarShop
--1.      Write a SELECT statement that returns these columns from the Products table:
--The ListPrice column
--A column that uses the CAST function to return the ListPrice column 
	--with 1 digit to the  right of the decimal point
--A column that uses the CONVERT function to return the ListPrice column as an integer
--A column that uses the CAST function to return the ListPrice column as an integer
SELECT ListPrice,
	(CAST(ListPrice AS DECIMAL(10,1)))  
	-- *** this is not shown in your Cast video, and the books syntax does not work for me, and I can't find anything online.
FROM Products; 
	-- You want to cast as decimal instead of a number..
	-- ???? cast(value as decimal(10,2)) 10 is the total numbers including the decimals and 2 is the number of decimals
	-- Can't find any docs with these parameters

--2.      Write a SELECT statement that returns these columns from the Products table:
--The DateAdded column
--A column that uses the CAST function to return the DateAdded column with its date only (year, month, and day)
--A column that uses the CAST function to return the DateAdded column with its full time only (hour, minutes, seconds, and milliseconds)
--A column that uses the CAST function to return the DateAdded column with just the month and day  HINT: use CAST(DateAdded AS CHAR(7)) AS AddedChar7

SELECT DateAdded,
	CAST(DateAdded AS date) AS DateOnly,
    CAST(DateAdded AS time) AS TimeOnly,
    CAST(DateAdded AS varchar(6)) MonthDay
FROM Products;

--3.      Write a SELECT statement that returns these columns from the Orders table:
--A column that uses the CONVERT function to return the OrderDate column in this format: MM/DD/YY. In other words, use two-digit months, days, and years and separate each date component with slashes
--A column that uses the CONVERT function to return the OrderDate column with the date, and the hours and minutes on a 12-hour clock with an am/pm indicator
--A column that uses the CONVERT function to return the OrderDate column with 2-digit hours, minutes, and seconds on a 24-hour clock. Use leading zeros for all date/time components.

Select OrderDate,
	CONVERT(DATETIME, OrderDate, 12) AS AddedChar12,
	CONVERT(DATETIME, OrderDate, 14) AS AddedChar14,
	CONVERT(DATETIME, OrderDate, 7) AS AddedChar7
FROM Orders;

--HINT: page 255

--Deliverables:
--A single Zipped .SQL File.
--The SQL statements must be numbered in order for each activity.
--DO NOT submit Result Sets from testing queries. Only submit the SQL statement required for each exercise. Documents containing Result Sets may be downgraded if Result Sets and extraneous data make the files hard to read.
--DO NOT write SQL statements in one continuous line. Format SQL statements as exampled in the textbook and Instructor Notes.
--Submissions not meeting the conditions stated above or not submitted appropriately will not be accepted. 

