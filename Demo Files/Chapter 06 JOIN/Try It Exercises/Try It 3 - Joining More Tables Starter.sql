USE RetailBankingSample;

SELECT C.CustomerID, C.FirstName, C.LastName
	, A.AccountID, A.OpeningBalance, A.OpeningDate
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.AccountID
;