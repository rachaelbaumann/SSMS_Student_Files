USE RetailBankingSample;

-- Declare a table variable named '@TransactionTotals' with columns and data types defined int the
-- intro to the Try It 3
DECLARE @TransactionTotals TABLE 
	(AccountID int,
	 TransactionYear int,
	 TotalAmount money);

-- Populate the table variable
INSERT INTO @TransactionTotals
SELECT AcctID, YEAR(TransactionDate) AS TransactionYear, SUM(Amount) AS Total
FROM AccountTransaction
GROUP BY AcctID, YEAR(TransactionDate);

--Return all columns and all rows from the table variable sorted by AccountID
SELECT * FROM @TransactionTotals
ORDER BY AccountID, TransactionYear;