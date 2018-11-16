USE RetailBankingSample;

-- Query from Try It 1
SELECT C.CustomerID, C.FirstName, C.LastName, A.AccountID, A.OpeningDate
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.PrimaryCustomerID;

-- Return all customers
SELECT C.CustomerID, C.FirstName, C.LastName, A.AccountID, A.OpeningDate
FROM Customer AS C
	LEFT OUTER JOIN Account AS A
	ON C.CustomerID = A.PrimaryCustomerID;

-- Return employees that exist in both tables
SELECT A.AccountID, A.EmployeeID, A.AccountTypeID,
	   E.EmployeeID, E.FirstName, E.LastName
FROM Account AS A
	 INNER JOIN Employee AS E
	 ON A.EmployeeID = E.EmployeeID;

-- Locate both rows in the Account table that have an invalid EmployeeID value and 
-- any employees that are never listed in the Account table
SELECT A.AccountID, A.EmployeeID, A.AccountTypeID,
	   E.EmployeeID, E.FirstName, E.LastName
FROM Account AS A
	 FULL OUTER JOIN Employee AS E
	 ON A.EmployeeID = E.EmployeeID;

-- Locate any rows in either table that don't match an EmployeeID in the other table
SELECT A.AccountID, A.EmployeeID, A.AccountTypeID,
	   E.EmployeeID, E.FirstName, E.LastName
FROM Account AS A
	 FULL OUTER JOIN Employee AS E
	 ON A.EmployeeID = E.EmployeeID
	 WHERE E.EmployeeID IS NULL
	 OR A.EmployeeID IS NULL;