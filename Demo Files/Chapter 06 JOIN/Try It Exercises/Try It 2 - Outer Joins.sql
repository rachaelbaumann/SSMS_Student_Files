USE RetailBankingSample;

--Step #1
SELECT C.CustomerID, C.FirstName, C.LastName
	, A.AccountID, A.OpeningDate
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.PrimaryCustomerID
;

--Step #2
SELECT C.CustomerID, C.FirstName, C.LastName
	, A.AccountID, A.OpeningDate
FROM Customer AS C
	LEFT OUTER JOIN Account AS A
	ON C.CustomerID = A.PrimaryCustomerID
;

--Step #3
SELECT A.AccountID, A.EmployeeID, A.AccountTypeID 
	, E.EmployeeID, E.FirstName, E.LastName
FROM Account AS A
	INNER JOIN Employee AS E
	ON A.EmployeeID = E.EmployeeID
;

--Step #4
SELECT A.AccountID, A.EmployeeID, A.AccountTypeID 
	, E.EmployeeID, E.FirstName, E.LastName
FROM Account AS A
	FULL OUTER JOIN Employee AS E
	ON A.EmployeeID = E.EmployeeID
;

--Step #5
SELECT A.AccountID, A.EmployeeID, A.AccountTypeID 
	, E.EmployeeID, E.FirstName, E.LastName
FROM Account AS A
	FULL OUTER JOIN Employee AS E
	ON A.EmployeeID = E.EmployeeID
	WHERE E.EmployeeID IS NULL
		OR A.EmployeeID IS NULL
;