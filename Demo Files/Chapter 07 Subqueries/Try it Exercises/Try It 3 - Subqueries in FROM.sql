USE RetailBankingSample;

--Step #2
SELECT CA.CustomerID
		 , COUNT(CA.AccountID) AS NumberofAccounts 
	  FROM CustomerAccount AS CA
	  GROUP BY CA.CustomerID
	  HAVING Count(AccountID) > 1

--Step #4
SELECT C.CustomerID, C.FirstName, C.LastName
	, A.AccountID ,AT.AccountType
FROM Customer AS C 		
	INNER JOIN CustomerAccount AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN Account AS A
		ON A.AccountID = CA.AccountID
	INNER JOIN AccountType AS AT
		ON A.AccountTypeID = AT.AccountTypeID
;

--Step #6
SELECT C.CustomerID, C.FirstName, C.LastName
	, A.AccountID ,AT.AccountType
FROM Customer AS C 		
	INNER JOIN CustomerAccount AS CA
		ON C.CustomerID = CA.CustomerID
	INNER JOIN Account AS A
		ON A.AccountID = CA.AccountID
	INNER JOIN AccountType AS AT
		ON A.AccountTypeID = AT.AccountTypeID
ORDER BY CustomerID
;

--Step #7
SELECT C.CustomerID, Sub.NumberofAccounts
	, C.FirstName, C.LastName
	, A.AccountID ,AT.AccountType
FROM
	(SELECT CA.CustomerID
		 , COUNT(CA.AccountID) AS NumberofAccounts 
	  FROM CustomerAccount AS CA
	  GROUP BY CA.CustomerID
	  HAVING Count(AccountID) > 1) AS Sub
	INNER JOIN Customer AS C 
		ON Sub.CustomerID =C.CustomerID
	INNER JOIN CustomerAccount AS CA
		ON Sub.CustomerID = CA.CustomerID
	INNER JOIN Account AS A
		ON A.AccountID = CA.AccountID
	INNER JOIN AccountType AS AT
		ON A.AccountTypeID = AT.AccountTypeID
ORDER BY CA.CustomerID
;

--Step #8
SELECT C.CustomerID, Sub.NumberofAccounts
	, C.FirstName, C.LastName
	, A.AccountID ,AT.AccountType
FROM
	(SELECT CA.CustomerID
		 , COUNT(CA.AccountID) AS NumberofAccounts 
	  FROM CustomerAccount AS CA
	  GROUP BY CA.CustomerID
	  HAVING Count(AccountID) > 1) AS Sub
	INNER JOIN Customer AS C 
		ON Sub.CustomerID =C.CustomerID
	INNER JOIN CustomerAccount AS CA
		ON Sub.CustomerID = CA.CustomerID
	INNER JOIN Account AS A
		ON A.AccountID = CA.AccountID
	INNER JOIN AccountType AS AT
		ON A.AccountTypeID = AT.AccountTypeID
ORDER BY CA.AccountID
;