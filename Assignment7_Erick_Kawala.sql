/*1.      Write an INSERT statement that adds this row to the Categories table:
CategoryName:         	Brass
Code the INSERT statement so SQL Server automatically generates the value for the CategoryID column.
*/

insert into Categories (CategoryName)
values ('Brass');


/* 2.      Write an UPDATE statement that modifies the row you just added to the Categories table. This statement should change the CategoryName column to “Woodwinds”, and it should use the CategoryID column to identify the row.
*/

update Categories
set CategoryName = 'Woodwinds'
where CategoryID = 5;

/* 3.      Write a DELETE statement that deletes the row you added to the Categories table in Activity 1. This statement should use the CategoryID column to identify the row.
*/
delete from Categories
where CategoryID = 5;


/*4.      Write an INSERT statement that adds this row to the Products table:
ProductID:                	The next automatically generated ID
CategoryID:              	4
ProductCode:            	dgx_640
ProductName:           	Yamaha DGX 640 88-Key Digital Piano
Description:              	Long description to come.
ListPrice:                  	799.99
DiscountPercent:      	0
DateAdded:              	Today’s date/time.

Use a column list for this statement.

Hint: Because ProductID is automatically generated and DiscountPercent defaults to 0, they do not need to be inserted.
*/

insert into Products
	(CategoryID, ProductCode, ProductName, Description, ListPrice, DiscountPercent, DateAdded)
values
	(4, 'dgx_640', 'Yamaha DGX 640 88-Key Digital Piano', 'Long description to come.', 799.99, 0, CURRENT_TIMESTAMP);

/*
5.      Write an UPDATE statement that modifies the product you added in exercise 4. This statement should change the DiscountPercent column from 0% to 35%.
*/

update Products
set DiscountPercent = 35
where ProductID = 11;

/*
6.      Write a DELETE statement that deletes the row in the Categories table that has an ID of 4. When you execute this statement, it will produce an error since the category has related rows in the Products table. To fix that, precede the DELETE statement with another DELETE statement that deletes all products in this category.
*/

delete from Products
where CategoryID = 4;
delete from Categories
where CategoryID = 4;

/*
7.      Write an INSERT statement that adds this row to the Customers table:
EmailAddress:          	rick@raven.com
Password:                 	(empty string)
FirstName:               	Rick
LastName:                	Raven

Use a column list for this statement.
*/

insert into Customers
	(EmailAddress, Password, FirstName, LastName)
values
	('rick@raven.com', '', 'Rick', 'Raven');

/*
8.      Write an UPDATE statement that modifies the Customers table. Change the password column to “secret” for the customer with an email address of rick@raven.com.
*/

update Customers
set Password = 'secret'
where EmailAddress = 'rick@raven.com';

/*
9.      Write an UPDATE statement that modifies the Customers table. Change the password column to “reset” for every customer in the table.
Hint: When changing the data for every record in the table, omit the WHERE clause.
*/

update Customers
set Password = 'reset';

/*
10.  Write insert statements that will insert at least one row into each of the MyGuitarShop database tables.
Your inserts should not produce constraint errors that conflict with the existing database table data.  
Only submit your new insert statements. 
*/
--INSERT using block insert?



/*
11.   Open the script named CreateMyGuitarShop.sql that’s in the Course Materials Folder. Then, run this script. This step will restore the data to its original state. NOTHING needs to be submitted for this activity. 
*/