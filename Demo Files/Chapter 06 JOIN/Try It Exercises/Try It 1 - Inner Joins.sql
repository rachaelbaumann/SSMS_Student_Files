USE RetailBankingSample;

--Step #1
SELECT C.CustomerID, C.FirstName, C.LastName
	, A.AccountID, A.OpeningDate
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.PrimaryCustomerID
;

--Step #2
SELECT A.AccountID, A.PrimaryCustomerID, A.OpeningDate
FROM Account AS A
;

--Step #3
SELECT  A.AccountID, A.CreditLimit, A.OpeningDate
	, CA.AccountNumber
FROM Account AS A
	INNER JOIN CustomerAccount AS CA
	ON A.PrimaryCustomerID = CA.CustomerID
		AND A.AccountID = CA.AccountID
;

--Step #5
SELECT  A.AccountID, CA.AccountID, A.CreditLimit, A.OpeningDate
	, CA.AccountNumber, A.PrimaryCustomerID, CA.CustomerID
FROM Account AS A
	INNER JOIN CustomerAccount AS CA
	ON 
		A.PrimaryCustomerID = CA.CustomerID
		--AND 
		--A.AccountID = CA.AccountID
;

