USE RetailBankingSample;

-- Write a query to return columns from the Account table in RBS
SELECT A.AccountID, A.OpeningDate, A.OpeningBalance, A.AccountTypeID
FROM Account AS A
WHERE A.AccountTypeID BETWEEN 6 AND 9;

-- Return the count of all the rows in the LoanTransaction table
SELECT COUNT(*)
FROM LoanTransaction;

-- Put the two queries together to make a single query that returns the result set described in
-- this 'Try It'
SELECT A.AccountID, A.OpeningDate, A.OpeningBalance,
	   (SELECT COUNT(*)
	   FROM LoanTransaction AS LT
	   WHERE LT.AcctID = A.AccountID) AS NumTransactions
FROM Account AS A
WHERE A.AccountTypeID BETWEEN 6 AND 9;
