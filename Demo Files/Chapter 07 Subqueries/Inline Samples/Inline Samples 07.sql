USE RetailBankingSample;

--Nested Subquery
SELECT A.AccountID, A.OpeningBalance
	, (SELECT AVG(OpeningBalance) 
		 FROM Account WHERE AccountTypeID = 12)
	AS [AvgAllAcctType12OpeningBalance]
FROM Account AS A
WHERE AccountTypeID = 12
;

--Correlated Subquery
SELECT A.AccountID, A.OpeningBalance, A.AccountTypeID
	, (SELECT AVG(OpeningBalance) 
		 FROM Account AS InnerAcct
		 WHERE InnerAcct.AccountTypeID = A.AccountTypeID
		 GROUP BY AccountTypeID
		 ) AS [AvgOpeningBalancePerAcctType]
FROM Account AS A
;


-- Kelsey's Correlated Query
SELECT EO.EmployeeID, EO.Salary, EO.HireDate
FROM Employee AS EO
WHERE Salary > (
	SELECT AVG(Salary) FROM Employee
	WHERE YEAR(HireDate) = YEAR(EO.HireDate)
)
ORDER BY HireDate;


--Subquery in SELECT
SELECT A.AccountID, CONVERT(varchar(20), A.OpeningBalance, 1)
	, CONVERT(varchar(20)
					, ((SELECT AVG(OpeningBalance) 
											FROM Account 
											WHERE AccountTypeID = 12
											) - A.OpeningBalance
										   )
					 , 1
					 )
	AS DifferenceFromAvg 
FROM Account AS A
WHERE AccountTypeID = 12
;

-- Subquery in WHERE
-- Retrieve transactions from accounts with more than one customer
SELECT AT.AcctID, AT.TransactionType, AT.Amount
FROM AccountTransaction AS AT
WHERE AT.AcctID IN (SELECT AccountID
	FROM CustomerAccount
	GROUP BY AccountID
	HAVING COUNT(*) > 1)
;


-- subquery in FROM
-- Retrieve transactions from accounts with more than one customer
SELECT AccountID,  AT.TransactionType,  AT.Amount
FROM (SELECT AccountID, COUNT(*) AS CustomerCount
	FROM CustomerAccount
	GROUP BY AccountID
	HAVING COUNT(*) > 1) AS MultiuserAccounts
INNER JOIN AccountTransaction AS AT
ON AT.AcctID = MultiuserAccounts.AccountID
; 


--Alternatives to Subqueries
--Sample Subquery
SELECT CA.AccountID, CA.CustomerID, CA.AccountNumber
FROM CustomerAccount AS CA
	WHERE CustomerID IN (SELECT C.CustomerID 
										FROM Customer AS C
										WHERE ZipCode LIKE '1%')
;

--Sample Join
SELECT CA.AccountID, CA.CustomerID, CA.AccountNumber
FROM CustomerAccount AS CA
	INNER JOIN Customer AS C
	ON CA.CustomerID = C.CustomerID
WHERE C.ZipCode LIKE '1%'
;

--Reworking subquery with OVER
--Sample Subquery
SELECT A.AccountID, A.OpeningDate, A.OpeningBalance
	, (SELECT COUNT(*)
		FROM LoanTransaction AS LT
		WHERE LT.AcctID = A.AccountID
		) AS NumberTransactions
FROM Account AS A
WHERE AccountTypeID BETWEEN 6 AND 9
;

--Sample OVER Clause
SELECT DISTINCT A.AccountID, A.OpeningDate, A.OpeningBalance
	, COUNT(*) OVER (PARTITION BY A.AccountID)
		   AS NumberTransactions
FROM Account AS A
	INNER JOIN LoanTransaction AS LT
	ON LT.AcctID = A.AccountID
WHERE AccountTypeID BETWEEN 6 AND 9
;
