USE RetailBankingSample;

--INNER JOIN
SELECT C.CustomerID, C.FirstName, C.LastName, CA.AccountID, CA.AccountNumber
FROM Customer AS C
	INNER JOIN CustomerAccount AS CA
	ON C.CustomerID = CA.CustomerID
;

--LEFT OUTER - Sample 1 under Left and Right Outer Joins
SELECT C.FirstName, C.LastName, A.AccountID
FROM Customer AS C
	LEFT OUTER JOIN  Account AS A
	ON C.CustomerID = A.PrimaryCustomerID
;

--RIGHT OUTER - Sample 2 under Left and Right Outer Joins
SELECT C.FirstName, C.LastName, A.AccountID
FROM Account AS A
	RIGHT OUTER JOIN  Customer AS C
	ON C.CustomerID = A.PrimaryCustomerID
;

--FULL OUTER
SELECT C.CustomerID, C.ZipCode
	, CA.AccountID, CA.AccountNumber
FROM CustomerAccount AS CA
	FULL OUTER JOIN Customer AS C
	ON C.CustomerID = CA.CustomerID
;

--Joining Three or More Tables
SELECT C.FirstName, C.LastName
	, LT.Amount, LT.TransactionDate, LT.TransactionType
FROM Customer AS C
	INNER JOIN Account AS A
	ON C.CustomerID = A.PrimaryCustomerID
	INNER JOIN LoanTransaction AS LT
	ON LT.AcctID = A.AccountID
;
	
--Self-join
SELECT CA1.AccountID
	, CA1.CustomerID, CA2.CustomerID
FROM CustomerAccount AS CA1
	INNER JOIN CustomerAccount AS CA2
	ON CA1.AccountID = CA2.AccountID
		AND CA1.CustomerID < CA2.CustomerID
ORDER BY CA1.CustomerID, CA2.CustomerID
;

--UNION
SELECT C.FirstName, C.LastName, C.ZipCode
FROM Customer AS C
UNION ALL
SELECT E.FirstName, E.LastName, 'Not available'
FROM Employee AS E
ORDER BY LastName, FirstName
;

--INTERSECT
SELECT CT.AcctID
FROM CreditTransaction AS CT
WHERE TransactionDate BETWEEN '20170101' AND '20171231'
INTERSECT 
SELECT CT.AcctID
FROM CreditTransaction AS CT
WHERE TransactionDate BETWEEN '20160101' AND '20161231'
INTERSECT 
SELECT CT.AcctID
FROM CreditTransaction AS CT
WHERE TransactionDate BETWEEN '20150101' AND '20151231'
ORDER BY AcctID
;


--EXCEPT
SELECT CT.AcctID
FROM CreditTransaction AS CT
WHERE TransactionDate BETWEEN '20170101' AND '20171231'
EXCEPT
SELECT CT.AcctID
FROM CreditTransaction AS CT
WHERE TransactionDate BETWEEN '20160101' AND '20161231'
;