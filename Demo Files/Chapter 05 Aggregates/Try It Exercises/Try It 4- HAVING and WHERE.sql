USE RetailBankingSample;

SELECT LT.AcctID, SUM(LT.Amount) AS TotalInterest
FROM LoanTransaction AS LT
WHERE LT.TransactionType = 'Interest'
GROUP BY LT.AcctID
HAVING SUM(LT.Amount)  > 10000
;