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

-- SUBQUERIES IN A WHERE CLAUSE
-- Limit the rows in a result set based on the data that is returned from a different query.
-- RULES:
--		*Unless using EXISTS, the subquery will return a single column.
--		*If a comparison operator is used in the WHERE clause of the outer query, a single value
--			must be returned from the inner query.
--		*With th IN keyword, multiple values in a single column are allowed.
--		*When using IN or a comparison operator, the column in the WHERE clause of the outer
--			query must be of a compatible data type to the column in the SELECT list of the outer query
SELECT AT.AcctID, AT.TransactionType, AT.Amount
FROM AccountTransaction AS AT
WHERE AT.AcctID IN (
	SELECT AccountID
	FROM CustomerAccount
	GROUP BY AccountID
	HAVING COUNT(*) > 1
);

-- EXISTS
-- Used to check if any rows are returned by the subquery. Returns True or False.
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
WHERE NOT EXISTS (
	SELECT 1 FROM Account AS A
	WHERE A.PrimaryCustomerID = C.CustomerID
);

-- SUBQUERIES IN FROM CLAUSE
-- Referred to as a 'derived table'. Used when you want to manipulate data by:
--		*changing column definitions 
--		*joining multiple tables together
--		*performing aggregations
--		*or other data manipulation.
-- The following will return ATrans for accounts with more than one linked customer.
SELECT AccountID, AT.TransactionType, AT.Amount
FROM (
	SELECT AccountID, COUNT(*) AS CustomerCount
	FROM CustomerAccount
	GROUP BY AccountID
	HAVING COUNT(*) > 1
 ) AS MultiUserAccounts
 INNER JOIN AccountTransaction AS AT
 ON AT.AcctID = MultiUserAccounts.AccountID;

