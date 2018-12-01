USE RetailBankingSample;

--COUNT and COUNT_BIG
SELECT COUNT(*) AS CountAllRows
	, COUNT(C.MiddleName) AS CountPopulatedMiddleNames
FROM Customer AS C
;

--not displayed in book - alternate query discussed
SELECT COUNT(*) AS NULLMiddleNames
FROM Customer AS C
WHERE C.MiddleName IS NOT NULL
;

SELECT COUNT(*) AS NULLMiddleNames
FROM Customer AS C
WHERE C.MiddleName IS NULL
;

--MIN, MAX, SUM, AVG
SELECT MIN(AT.Amount) AS Minimum
	, MAX(AT.Amount) AS Maximum
	,AVG(AT.Amount) AS Average
	,SUM(AT.Amount) AS Total
FROM AccountTransaction AS AT
;

--GROUP BY
SELECT AT.AcctID
	, MIN(AT.Amount) AS Minimum
	, MAX(AT.Amount) AS Maximum
	,AVG(AT.Amount) AS Average
	,SUM(AT.Amount) AS Total
FROM AccountTransaction AS AT
GROUP BY AT.AcctID
;

--HAVING
SELECT AT.AcctID
	, MIN(AT.Amount) AS Minimum
	, MAX(AT.Amount) AS Maximum
	,AVG(AT.Amount) AS Average
	,SUM(AT.Amount) AS Total
FROM AccountTransaction AS AT
GROUP BY AT.AcctID
HAVING SUM(AT.Amount) > 0
;

--HAVING vs WHERE
SELECT AT.AcctID
	, MIN(AT.Amount) AS Minimum
	, MAX(AT.Amount) AS Maximum
	,AVG(AT.Amount) AS Average
	,SUM(AT.Amount) AS Total
FROM AccountTransaction AS AT
WHERE TransactionType = 'Direct Deposit'
GROUP BY AT.AcctID
HAVING SUM(AT.Amount) > 400000
;

--ROLLUP and CUBE - starter - 20 rows returned
SELECT E.ReportsTo, E.Title
	, COUNT(*) AS EmployeeCount
FROM Employee AS E
GROUP BY E.ReportsTo, E.Title
ORDER  BY E.ReportsTo
;

--ROLLUP and CUBE - ROLLUP option - 32 rows returned
SELECT ReportsTo, E.Title
	, COUNT(*) AS EmployeeCount
FROM Employee AS E
GROUP BY ROLLUP (E.ReportsTo, E.Title)
ORDER BY E.ReportsTo
;

--ROLLUP and CUBE - CUBE option - 37 rows returned
SELECT ReportsTo, E.Title
	, COUNT(*) AS EmployeeCount
FROM Employee AS E
GROUP BY CUBE (E.ReportsTo, E.Title)
ORDER BY E.ReportsTo, E.Title
;

--OVER with Aggregates
SELECT LT.LoanTransactionID, LT.TransactionDate, LT.Amount
	, SUM(LT.Amount) 
	-- order by transation date
		OVER (PARTITION BY DatePart(yy,LT.TransactionDate)
					 ORDER BY LT.TransactionDate,LT.LoanTransactionID
				 )
	AS AnnualRunningTotal
FROM LoanTransaction AS LT
WHERE LT.TransactionType = 'Interest'
ORDER BY TransactionDate, LoanTransactionID
;

--OVER with Ranking functions
SELECT A.AccountID, A.OpeningBalance
	, RANK() OVER (ORDER BY A.OpeningBalance) AS BalanceRank
	, DENSE_RANK() OVER (ORDER BY A.OpeningBalance) AS BalanceDenseRank
	, ROW_NUMBER() OVER (ORDER BY A.OpeningBalance) AS BalanceRowNumber
	, NTILE(10) OVER (ORDER BY A.OpeningBalance) AS BalanceGroupNumber
FROM Account AS A
;