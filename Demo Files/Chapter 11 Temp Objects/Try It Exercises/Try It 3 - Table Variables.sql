--Step #2
USE RetailBankingSample;

--Step #3
DECLARE @TransactionTotals table (AccountID int, TransactionYear int, TotalAmt money);

--Step #5
INSERT INTO @TransactionTotals 
SELECT AcctID, YEAR(TransactionDate) AS TransactionYear
	, SUM(Amount) AS Total
FROM AccountTransaction 
GROUP BY AcctID, YEAR(TransactionDate)
;

SELECT * FROM @TransactionTotals
ORDER BY AccountID, TransactionYear;
