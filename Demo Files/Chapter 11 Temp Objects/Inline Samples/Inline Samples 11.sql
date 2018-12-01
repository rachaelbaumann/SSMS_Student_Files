USE RetailBankingSample;

--Declaring Variables
DECLARE @charactervar varchar(30) = 'testing 1 2 3'
	  , @numbervar int = 123
;
SELECT @charactervar, @numbervar;


--Sample SET
DECLARE @charvar varchar(30) = 'poo poo pee do';
SET @charvar = 'testing 4 5 6';

SELECT @charactervar;

--Sample SELECT
SELECT @charactervar = 'testing 7, 8, 9';

--SELECT @charactervar;

--Sample Query Result
SET @charactervar = (SELECT MAX(FirstName) FROM Customer);

--Table Variables
DECLARE @mytable table (Mykey int identity, FirstName varchar(20),
					    LastName varchar(20), CustomerKey int);

INSERT INTO @mytable (FirstName, LastName, CustomerKey)
	SELECT RTRIM(FirstName) AS FirstName
		, RTRIM(LastName) AS LastName
		, CustomerID
	FROM Customer
;

SELECT * FROM @mytable;

--Temp Tables
-- can execute in two steps insetead of all at once
SELECT RTRIM(FirstName) AS FirstName
		, RTRIM(LastName) AS LastName
		, CustomerID 
INTO #TempCustomer
FROM Customer;

SELECT * FROM #TempCustomer;

--CTE - Simple
WITH Account_CTE (CustomerID, AccountID, OpeningYear)
AS
( SELECT C.CustomerID, A.AccountID, YEAR(A.OpeningDate)
   FROM Customer AS C 
		INNER JOIN Account AS A
		ON C.CustomerID = A.PrimaryCustomerID
)
SELECT CustomerID, OpeningYear, COUNT(AccountID) AS AnnualAccountOpening
FROM Account_CTE
GROUP BY OpeningYear, CustomerID
ORDER BY AnnualAccountOpening DESC
;

--CTE Recursive
-- Creates EmployeeLevel
WITH ReportsTo_CTE (EmployeeID, ManagerID, Title, EmployeeLevel)
AS
( SELECT E.EmployeeID, E.ReportsTo, E.Title, 0 AS EmployeeLevel -- set EL to 0
   FROM Employee AS E
   WHERE ReportsTo IS NULL
   UNION ALL -- Do a UNION with recursive
   SELECT E.EmployeeID, E.ReportsTo, E.Title, EmployeeLevel + 1
   FROM Employee AS E
	INNER JOIN ReportsTo_CTE AS M
	ON E.ReportsTo = M.EmployeeID
)
SELECT EmployeeID, ManagerID, Title, EmployeeLevel
FROM ReportsTo_CTE -- Termination: WHERE EmployeeLevel < n
ORDER BY EmployeeLevel;
