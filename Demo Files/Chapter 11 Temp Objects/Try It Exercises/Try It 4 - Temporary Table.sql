USE RetailBankingSample;

--Step #3
SELECT C.FirstName, C.LastName, CA.AccountNumber
INTO #TempCustomerAccountInfo 
FROM Customer AS C
	INNER JOIN CustomerAccount AS CA
	ON C.CustomerID = CA.CustomerID
;

--Step #5
SELECT * FROM #TempCustomerAccountInfo;