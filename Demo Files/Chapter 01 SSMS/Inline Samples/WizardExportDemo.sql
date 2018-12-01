SELECT E.FirstName, E.LastName, E.Title
	, A.AccountID, A.OpeningBalance, A.OpeningDate
	, AT.AccountType
FROM Employee AS E
	INNER JOIN Account AS A
	ON A.EmployeeID = E.EmployeeID
	INNER JOIN AccountType AS AT
	ON AT.AccountTypeID = A.AccountTypeID
;