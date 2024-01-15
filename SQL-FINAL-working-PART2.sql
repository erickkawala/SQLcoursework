USE AcmeFurniture;
GO

-- 1. Load only "Mary" as Customer Name and any additional required fields in the Customer Table.
SELECT * FROM Customer
WHERE FName = 'Mary';
GO

-- 2. Change the name from "Mary" to "Michelle" for the customer entered in #1.

UPDATE Customer
SET FName = 'Michelle'
WHERE (FName = 'Mary');

SELECT * FROM CUSTOMER
GO

--3. Add Milwaukee for the City and 53201 as the Zip to the customer entered in #1.

UPDATE Customer
SET City = 'Milwaukee', ZipCode = 53201
WHERE (CustomerNumber = 0);

SELECT * FROM CUSTOMER
GO

--4. Remove the customer entered in #1.

ALTER TABLE Orders
NOCHECK CONSTRAINT 

ON DELETE CASCADE;
GO

DELETE FROM Customer 
WHERE CustomerNumber=0;
Go

SELECT * FROM Customer;
GO
