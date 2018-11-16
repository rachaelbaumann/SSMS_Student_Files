USE RetailBankingSample;

SELECT C.CustomerID, C.FirstName, C.LastName, A.AccountID, A.OpeningDate
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.AccountID;

SELECT A.AccountID, A.PrimaryCustomerID, A.OpeningDate, CA.AccountNumber
FROM Account AS A
	INNER JOIN CustomerAccount AS CA
	ON A.PrimaryCustomerID = CA.CustomerID
	AND A.AccountID = CA.AccountID;

SELECT A.AccountID, CA.AccountID, A.CreditLimit, A.OpeningDate, CA.AccountNumber, A.PrimaryCustomerID, 
	   CA.CustomerID
FROM Account AS A
	INNER JOIN CustomerAccount AS CA
	ON PrimaryCustomerID = CA.CustomerID;