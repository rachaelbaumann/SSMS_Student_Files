USE RetailBankingSample;

-- Return the most recent date for any transaction in the AT table
SELECT MAX(InnerAT.TransactionDate)
FROM AccountTransaction AS InnerAT

-- Return columns from AT 
SELECT ATr.AcctID, ATr.TransactionDate, ATr.Amount
FROM AccountTransaction AS ATr;

-- Only rows where the TransactionDate is equal to most recent date for any transaction 
-- should be returned
SELECT Atr.AcctID, ATr.TransactionDate, ATr.Amount
FROM AccountTransaction AS ATr
WHERE ATr.TransactionDate = (
	SELECT MAX(InnerAT.TransactionDate)
	FROM AccountTransaction AS InnerAT	
);

-- Correlate the queries and return the transaction(s) for each account that occurred
-- on the latest transaction date for that specific account
SELECT Atr.AcctID, ATr.TransactionDate, ATr.Amount
FROM AccountTransaction AS ATr
WHERE ATr.TransactionDate = (
	SELECT MAX(InnerAT.TransactionDate)
	FROM AccountTransaction AS InnerAT	
	WHERE InnerAT.AcctID = ATr.AcctID
)
ORDER BY ATr.AcctID;
