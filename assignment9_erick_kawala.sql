/*
Assignment 9
Chapter 11, Murach SQL Server 2012
Create and Maintain Tables with SQL

1.  Write a script that adds an index to the MyGuitarShop database for the zip code field in the 
Addresses table.
*/

use MyGuitarShop;
create index IX_Addresses_ZipCode
on Addresses (ZipCode);

/*
2.  Write a script that implements the following design in a database named MyWebDB:
  In the Downloads table, the UserID and ProductID columns are the foreign keys.
  Include a statement to drop the database if it already exists.
  Include statements to create and select the database.
  Include any indexes that you think are necessary.
*/

use master;
if exists
	(select * from sys.databases
	where name='MyWebDB')
drop database MyWebDB;
go

create database MyWebDB;
go

use MyWebDB;
create table Users(
UserID			int			not null primary key,
EmailAddress	varchar(50)		null,
FirstName		varchar(50)		null,
LastName		varchar(50)		null
);


create table Products(
ProductID		int			not null primary key,
ProductName		varchar(50)		null
);

create table Downloads(
DownloadID		int			not null primary key,
UserID			int			not null references Users (UserID),
DownloadDate		smalldatetime		null,
FileName		varchar(50)		null,
ProductID		int			not null references Products (ProductID)
);

create index IX_Downloads_UserID
on Downloads (UserID);
create index IX_Downloads_ProductID
on Downloads (ProductID);

/*
3.  Write a script that adds rows to the database that you created in exercise 2.
Add two rows to the Users and Products tables.
Add three rows to the Downloads table: one row for user 1 and product 2; one for user 2 
and product 1; and one for user 2 and product 2. Use the GETDATE function to insert the 
current date and time into the DownloadDate column.
Write a SELECT statement that joins the three tables and retrieves the data from these 
tables like this:
  email_address       first_name    last_name   download_date           filename                    product_name
  johnsmith@gmail.com John          Smith       2012-04024 16:15:38     pedals_are_falling.mp3      Local Music Vol 1
  janedoe@yahoo.com   Jane          Doe         2012-04024 16:15:38     turn_signal.mp3             Local Music Vol 1
  janedoe@yahoo.com   Jane          Doe         2012-04-24 16:15:38     one_horse_town.mp3          Local Music Vol 2
Sort the results by the email address in descending order and the product name in ascending 
order.
*/

use MyWebDB;
insert into Users
values 
	(1, 'bob@bob.com', 'Bob', 'McBobberson'),
	(2, 'billy@bob.com', 'Billy', 'McBobberson');

go
insert into Products
values 
	(1, 'ShamWow'),
	(2, 'NeverDull Ginsu Knife Set');

go
insert into Downloads
values 
	(1, 1, getdate(), 'file 1.txt', 2),
	(2, 2, getdate(), 'file 2.txt', 1),
	(3, 2, getdate(), 'file 3.txt', 2);

go
select u.EmailAddress as email_address,
	u.FirstName as first_name,
	u.LastName as last_name,
	d.DownloadDate as download_date,
	d.FileName as filename,
	p.ProductName as product_name
from Downloads d
join Users u
on u.UserID = d.UserID
join Products p
on p.ProductID = d.UserID
order by EmailAddress desc, ProductName asc

/*
4.  Write an ALTER TABLE statement that adds two new columns to the Products table created 
in exercise 2.
Add one column for product price that provides for three digits to the left of the decimal 
point and two to the right. This column should have a default value of 9.99.
Add one column for the date and time that the product was added to the database.
*/
use MyWebDB;
alter table Products
add ProductPrice numeric(5,2) default 9.99;

go
alter table Products
add DateProductAdded smalldatetime default getdate();

/*
5.  Write an ALTER TABLE statement that modifies the Users table created in exercise 2 so the 
FirstName column cannot store null values and can store a maximum of 20 characters.
Code an UPDATE statement that attempts to insert a null value into this column. It should fail 
due to the not null constraint.
Code another UPDATE statement that attempts to insert a first name that�s longer than 20 
characters. It should fail due to the length of the column.
*/

use MyWebDB;
alter table Users
alter column FirstName varchar(20) not null;

use MyWebDB;
update Users
set FirstName = null
where UserID = 1;

use MyWebDB;
update Users
set FirstName = '123456789012345678901'
where UserID = 1;
