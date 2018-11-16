USE RetailBankingSample;

SELECT A.AccountID, A.OpeningDate,
-- adds 30 years to the opening date
	DATEADD(YY, 30, A.OpeningBalance) AS [Loan Completion]
FROM Account AS A
-- limits result set to include accounts with an AcctTypeID of 6 or 9
WHERE AccountTypeID IN (6, 9);

-- calculates days since most recent transaction
SELECT LT.AcctID,
	DATEDIFF(dd, MAX(TransactionDate), GETDATE()) AS [Days Since Last Transaction]
FROM LoanTransaction AS LT
	INNER JOIN Account AS A
	ON LT.AcctID = A.AccountID
WHERE AccountTypeID IN (6,9)
GROUP BY AcctID
ORDER BY AcctID;