USE RetailBankingSample;

-- Create the #TempCustomerAccountInfo table
SELECT C.FirstName, C.LastName,
	   CA.AccountNumber
INTO #TempCustomerAccountInfo
FROM Customer AS C
	INNER JOIN CustomerAccount AS CA
	ON C.CustomerID = CA.CustomerID;

-- Get all columns and rows from #TempCustomerAccountInfo
SELECT * FROM #TempCustomerAccountInfo;