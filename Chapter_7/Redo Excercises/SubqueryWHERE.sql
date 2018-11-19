USE RetailBankingSample;

-- Subquery in WHERE clause
SELECT MAX(InnerAT.TransactionDate)
FROM AccountTransaction AS InnerAT;

-- Write a query to return columns from the AccountTransaction table
SELECT AT.AcctID, AT.TransactionDate, AT.Amount
FROM AccountTransaction AS AT;

-- Add a WHERE clause to the above query and use the subquery from the first step to compare
SELECT AT.AcctID, AT.TransactionDate, AT.Amount
FROM AccountTransaction AS AT
WHERE (
	SELECT MAX(InnerAT.TransactionDate)
	FROM AccountTransaction AS InnerAT
	WHERE InnerAT.AcctID = AT.AcctID
) = AT.TransactionDate
ORDER BY AT.AcctID;


