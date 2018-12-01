USE RetailBankingSample;

--Transactions Sample
BEGIN TRAN;

UPDATE Customer SET LastName = 'Smith';
SELECT RTRIM(FirstName) + ' ' + LastName FROM Customer;

ROLLBACK;

--INSERT defined columns
BEGIN TRANSACTION
INSERT INTO Customer (CustomerID, FirstName, LastName, CountryCode)
	VALUES (500, 'Ann', 'Smith', 'US'), (501, 'Bob', 'Jones', 'US'), (502, 'John', 'Casey', NULL);

SELECT * FROM Customer
ORDER BY CustomerID DESC;

--ROLLBACK  --once you have viewed the modifications, roll them back

--INSERT by position
BEGIN TRANSACTION
INSERT INTO Customer 
	VALUES (503, 'Ann',NULL ,'Smith', NULL, NULL, NULL, NULL, 'US', NULL)
		 , (504, 'Bob',NULL, 'Jones', NULL, NULL, NULL, NULL, 'US', NULL)
		 , (505, 'John', 'L', 'Casey', NULL, NULL, NULL, NULL, 'US', NULL);


SELECT * FROM Customer
ORDER BY CustomerID DESC;
ROLLBACK  --once you have viewed the modifications, roll them back

--INSERT SELECT
--CREATE new table to receive the inserted rows
CREATE TABLE SampleInsertSelect 
	(PersonID int, FirstName varchar(100), LastName varchar(100), Zipcode char(10))
;

INSERT INTO SampleInsertSelect
SELECT C.CustomerID, C.FirstName, C.LastName, C.ZipCode
FROM Customer AS C
UNION
SELECT E.EmployeeID, E.FirstName, E.LastName, 'N/A'
FROM Employee AS E
;

SELECT * FROM SampleInsertSelect;

--Cleanup - note - this table is used in future inline samples in this chapter
--You may want to wait to drop it at the end of the chapter.

DROP TABLE SampleInsertSelect



--SELECT INTO temporary table
-- Will exist until you lose your connection or close SSMS
SELECT C.FirstName, C.LastName
	, A.PrimaryCustomerID, A.OpeningBalance
	, AT.AccountType
INTO #TempSELECTINTO
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.PrimaryCustomerID
	INNER JOIN AccountType AS AT
	ON A.AccountTypeID = AT.AccountTypeID
;

SELECT * FROM #TempSELECTINTO;

--SELECT INTO new permanent table
SELECT C.FirstName, C.LastName
	, A.PrimaryCustomerID, A.OpeningBalance
	, AT.AccountType
INTO SELECTINTOSample
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.PrimaryCustomerID
	INNER JOIN AccountType AS AT
	ON A.AccountTypeID = AT.AccountTypeID
;

SELECT * FROM #TempSELECTINTO;


--UPDATE with a fixed value
BEGIN TRANSACTION
UPDATE SampleInsertSelect
SET Zipcode = '00000'
WHERE Zipcode = 'N/A'
;
SELECT * FROM SampleInsertSelect;
--COMMIT
--ROLLBACK


--UPDATE based on SELECT in both SET and WHERE clauses
	-- Test SELECT to see how many rows will be returned
SELECT * FROM SampleInsertSelect AS S
LEFT OUTER JOIN Employee AS E
ON E.EmployeeID = S.PersonID 
	AND E.LastName = S.LastName
	AND E.FirstName = S.FirstName
WHERE E.EmployeeID IS NOT NULL
;

--BEGIN TRANSACTION
UPDATE SampleInsertSelect
SET PersonID = E.EmployeeID + 500
FROM SampleInsertSelect AS S
LEFT OUTER JOIN Employee AS E
ON E.EmployeeID = S.PersonID
	AND E.LastName = S.LastName
	AND E.FirstName = S.FirstName
WHERE E.EmployeeID IS NOT NULL
;
--ROLLBACK
--COMMIT

--Queries to verify the UPDATE eliminated 
SELECT COUNT(*), PersonID FROM SampleInsertSelect
GROUP BY PersonID
HAVING COUNT(*) > 1

SELECT * FROM SampleInsertSelect
ORDER BY PersonID

--DELETE based on data in same table
BEGIN TRANSACTION
DELETE FROM SampleInsertSelect
WHERE PersonID = 55;

--Test then rollback transaction
SELECT * FROM SampleInsertSelect;
ROLLBACK

--DELETE based on data in another table
BEGIN TRANSACTION
DELETE FROM SampleInsertSelect
FROM SampleInsertSelect AS SI
INNER JOIN Customer AS C
ON SI.PersonID = C.CustomerID
WHERE StateProvinceCode = 'OH'
;

--Test then rollback transaction
SELECT * FROM SampleInsertSelect;
ROLLBACK

--TRUNCATE TABLE
BEGIN TRANSACTION
TRUNCATE TABLE SampleInsertSelect;

--Test then rollback transaction
SELECT * FROM SampleInsertSelect;
ROLLBACK

--Cleanup 
/*
DROP TABLE SampleInsertSelect
*/