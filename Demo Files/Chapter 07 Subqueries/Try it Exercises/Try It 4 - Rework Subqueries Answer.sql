USE RetailBankingSample;

--Step 3
SELECT C.CustomerID, C.FirstName, C.LastName
	, CA.AccountNumber
FROM Customer AS C
	INNER JOIN CustomerAccount AS CA
	ON C.CustomerID = CA.CustomerID
WHERE EXISTS (SELECT * FROM Customer AS InnerC
							WHERE InnerC.CustomerID = C.CustomerID
								AND InnerC.ZipCode LIKE '1%')
;

--Step 4
SELECT C.CustomerID, C.FirstName, C.LastName
	, CA.AccountNumber
FROM Customer AS C
	INNER JOIN CustomerAccount AS CA
	ON C.CustomerID = CA.CustomerID
WHERE C.ZipCode LIKE '1%'
;