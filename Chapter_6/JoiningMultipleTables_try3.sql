USE RetailBankingSample;

SELECT C.CustomerID, C.FirstName, C.LastName, 
	   A.AccountID, A.OpeningBalance, A.OpeningDate,
	   ATr.Amount, ATr.TransactionDate, ATr.TransactionType,
	   E.FirstName, E.LastName
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.AccountID
	INNER JOIN AccountTransaction AS ATr
	ON A.AccountID = ATr.AcctID
	INNER JOIN Employee AS E
	ON E.EmployeeID = A.EmployeeID;
;