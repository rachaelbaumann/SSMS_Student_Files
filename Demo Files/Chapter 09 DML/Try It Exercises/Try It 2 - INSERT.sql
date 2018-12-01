USE RetailBankingSample;

--Step #3
SELECT  C.FirstName + ' ' +  C.LastName AS CustomerName
	, C.CustomerID
	, CA.AccountNumber
	, A.AccountID, A.OpeningDate
	, CONVERT(datetimeoffset, A.OpeningDate) AS OpeningDateOffset
FROM Customer AS C
	INNER JOIN CustomerAccount AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN Account AS A
		ON A.AccountID = CA.AccountID
ORDER BY C.CustomerID
;

--Step #4
SELECT  C.FirstName + ' ' +  C.LastName AS CustomerName
	, C.CustomerID
	, CA.AccountNumber
	, A.AccountID, A.OpeningDate
	, CONVERT(datetimeoffset, A.OpeningDate) AS OpeningDateOffset
INTO CustomerAccountExtended 
FROM Customer AS C
	INNER JOIN CustomerAccount AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN Account AS A
		ON A.AccountID = CA.AccountID
ORDER BY C.CustomerID
;

--Step #6
SELECT * FROM CustomerAccountExtended;

--Step #7
INSERT INTO CustomerAccountExtended
	VALUES ('Ann Weber',500, 'AWeber900', 900, GETDATE(), SYSDATETIMEOFFSET())
;

--Step #8
SELECT * FROM CustomerAccountExtended
WHERE AccountID = 900;