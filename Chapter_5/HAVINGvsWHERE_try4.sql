USE RetailBankingSample;

SELECT LT.AcctID,
	   SUM(LT.Amount) AS [Total Interest]
FROM LoanTransaction AS LT
WHERE LT.TransactionType = 'Interest'
GROUP BY LT.AcctID
HAVING SUM(LT.Amount) > 10000;