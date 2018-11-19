USE RetailBankingSample;

-- Return the average opening balance for all accounts with an AccountTypeID of 12,
-- along with the opening balance for the account on each row.
SELECT A.AccountID, A.OpeningBalance,
	   (SELECT AVG(Act.OpeningBalance) FROM Account AS Act) AS [Average Opening Balance]
FROM Account AS A
WHERE AccountTypeID = 12;