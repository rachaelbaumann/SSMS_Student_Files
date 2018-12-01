USE RetailBankingSample;

--Step #2
SELECT C.CustomerID, C.FirstName, C.LastName
	, A.AccountID, A.OpeningBalance, A.OpeningDate
	, AT.Amount, AT.TransactionDate, AT.TransactionType
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.AccountID
	INNER JOIN AccountTransaction AS AT
	ON A.AccountID = AT.AcctID
;

--Step #3
SELECT C.CustomerID, C.FirstName, C.LastName
	, A.AccountID, A.OpeningBalance, A.OpeningDate
	, AT.Amount, AT.TransactionDate, AT.TransactionType
	, E.FirstName AS EmployeeFirstName
	, E.LastName AS EmployeeLastName
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.AccountID
	INNER JOIN AccountTransaction AS AT
	ON A.AccountID = AT.AcctID
	INNER JOIN Employee AS E
	ON E.EmployeeID = A.EmployeeID
;