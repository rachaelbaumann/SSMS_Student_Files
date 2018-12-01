USE RetailBankingSample;

--Step #2
SELECT A.AccountID, A.OpeningDate
FROM Account AS A
WHERE AccountTypeID IN (6,9)
;

--Step #3
SELECT A.AccountID, A.OpeningDate
	, DATEADD(yy, 30, A.OpeningDate) AS LoanCompletion
FROM Account AS A
WHERE AccountTypeID IN (6,9)
;

--Step #4
SELECT LT.AcctID
	, DATEDIFF(dd, MAX(TransactionDate), getdate()) AS DaysSinceLastTransaction
FROM LoanTransaction AS LT
	INNER JOIN Account AS A
	ON LT.AcctID = A.AccountID
WHERE AccountTypeID IN (6,9)
GROUP BY AcctID
ORDER BY AcctID
;


