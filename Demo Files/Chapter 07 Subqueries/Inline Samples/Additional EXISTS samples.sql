USE RetailBankingSample;

--statistics commands - highlight between the comments to run once
/*
SET STATISTICS IO ON
SET STATISTICS TIME ON
*/

--3 queries that return the same data and execution plan
SELECT A.AccountID, A.PrimaryCustomerID, A.OpeningBalance
FROM Account AS A
WHERE EXISTS (SELECT 1 
					     FROM AccountTransaction AS AT
						 WHERE A.AccountID = AT.AcctID
							AND AT.Amount > 5000)
;


SELECT DISTINCT A.AccountID, A.PrimaryCustomerID, A.OpeningBalance
FROM Account AS A
INNER JOIN AccountTransaction AS AT
ON A.AccountID = AT.AcctID
WHERE AT.Amount > 5000
;

SELECT A.AccountID, A.PrimaryCustomerID, A.OpeningBalance
FROM Account AS A
WHERE 1 <= (SELECT COUNT(*) FROM AccountTransaction AS AT
					WHERE Amount > 5000
						AND AT.AcctID = A.AccountID)
;


--2nd sample - 3 ways but different execution plan for the LEFT OUTER JOIN.
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
	LEFT OUTER JOIN Account AS A
	ON C.CustomerID = A.PrimaryCustomerID
WHERE A.PrimaryCustomerID IS NULL
;

SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
WHERE C.CustomerID NOT IN	(SELECT A.PrimaryCustomerID
											  FROM Account AS A)
;

SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
WHERE NOT EXISTS (SELECT 1 FROM Account AS A
								WHERE A.PrimaryCustomerID = C.CustomerID)
;