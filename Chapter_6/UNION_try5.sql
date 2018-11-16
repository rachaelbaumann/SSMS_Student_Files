USE RetailBankingSample;

-- Try It 5
SELECT CT.AcctID, CT.Amount, CT.TransactionDate, 'Credit Transactions' AS [Transaction Type]
FROM CreditTransaction AS CT
UNION ALL
SELECT LT.AcctID, LT.Amount, LT.TransactionDate, 'Loan Transactions'
FROM LoanTransaction AS LT
ORDER BY Amount DESC;


SELECT CONVERT(varchar(8),AT.AcctID)
	+ ' / ' + CONVERT(varchar(20), AT.Amount, 1)
	+ ' / ' + CONVERT(varchar(30), AT.TransactionDate, 109) AS TransactionDate
FROM AccountTransaction AS AT
;
