USE RetailBankingSample;

-- Return columns from CA
SELECT CA.CustomerID,
	   COUNT(CA.AccountID) AS [# Accounts]
FROM CustomerAccount AS CA
GROUP BY CA.CustomerID
HAVING COUNT(AccountID) > 1;

-- Join multiple tables together to return columns.
-- All rows in common between the tables should be returned.
-- HINT: Look at the database diagram for RBS
SELECT C.CustomerID, C.FirstName, C.LastName,
	   A.AccountID,
	   AT.AccountType
FROM Customer AS C
	INNER JOIN CustomerAccount AS CA
	ON C.CustomerID = CA.CustomerID
	INNER JOIN Account AS A
	ON A.AccountID = CA.AccountID
	INNER JOIN AccountType AS AT
	ON A.AccountTypeID = AT.AccountTypeID;

-- Add an ORDER BY clause and sort by CustomerID
SELECT C.CustomerID, C.FirstName, C.LastName,
	   A.AccountID,
	   AT.AccountType
FROM Customer AS C
	INNER JOIN CustomerAccount AS CA
	ON C.CustomerID = CA.CustomerID
	INNER JOIN Account AS A
	ON A.AccountID = CA.AccountID
	INNER JOIN AccountType AS AT
	ON A.AccountTypeID = AT.AccountTypeID
ORDER BY CustomerID;

-- Modify the INNER JOIN query in the FROM clause.
-- Give the subquery an alias and join it to the other tables in the outer query.
SELECT C.CustomerID, C.FirstName, C.LastName,
	   A.AccountID,
	   AT.AccountType
	FROM (
		SELECT CA.CustomerID,
			   COUNT(CA.AccountID) AS [# Accounts]
			   FROM CustomerAccount AS CA
			   GROUP BY CA.CustomerID
			   HAVING COUNT(AccountID) > 1
	) AS Sub
	INNER JOIN Customer AS C
	ON Sub.CustomerID = C.CustomerID
	INNER JOIN CustomerAccount AS CA
	ON C.CustomerID = CA.CustomerID
	INNER JOIN Account AS A
	ON A.AccountID = CA.AccountID
	INNER JOIN AccountType AS AT
	ON A.AccountTypeID = AT.AccountTypeID;