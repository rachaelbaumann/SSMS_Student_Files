USE RetailBankingSample;

-- NESTED SUBQUERY
-- Return the average opening balance for all accounts with an AccountTypeID of 12,
-- along with the opening balance for the account on each row.
SELECT A.AccountID, A.OpeningBalance,
	   (SELECT AVG(Act.OpeningBalance) FROM Account AS Act) AS [Average Opening Balance]
FROM Account AS A
WHERE AccountTypeID = 12;

-- CORRELATED SUBQUERY
-- Above query can be rewritten to display the average opening balance per AccountTypeID, rather
-- than for a single ATID. The ATID allows us to provide the average of the ATID in the row being 
-- returned. The inner query relies on the Account table aloiased as A in the outer query.
SELECT A.AccountID, A.OpeningBalance, A.AccountTypeID, 
	   (SELECT AVG(OpeningBalance) FROM Account AS InnerAcct
	   WHERE InnerAcct.AccountTypeID = A.AccountTypeID
	   GROUP BY AccountTypeID
	   ) AS [Average Opening Balance]
FROM Account AS A;

-- SUBQUERIES IN A SELECT CLAUSE
-- In the SELECT clause, the subquery returns one value per result set row displayed as a 
-- new column. **Alias the column containing the subquery**. This example takes the NESTED
-- subquery a bit further by calculating the difference between the opening balance and the 
-- average opening balance for all accounts with ATID = 12.
SELECT A.AccountID, A.OpeningBalance, 
	   (SELECT AVG(OpeningBalance) FROM Account 
	   WHERE AccountTypeID = 12) - A.OpeningBalance AS [Difference from Average]
FROM Account AS A
WHERE AccountTypeID = 12;