USE RetailBankingSample;

-- Return columns from Accounts for aactID's between 6 and 9
SELECT A.AccountID, A.OpeningDate, A.OpeningBalance
FROM Account AS A
WHERE AccountTypeID BETWEEN 6 AND 9;

-- Return all rows in LT table
SELECT COUNT(*)
FROM LoanTransaction AS LT;

-- Put the two queries together to make a single query that returns the result set
SELECT A.AccountID, A.OpeningDate, A.OpeningBalance, 
	   (SELECT COUNT(*) 
	    FROM LoanTransaction AS LT
		WHERE LT.AcctID = A.AccountID
		) AS [# Transactions]
FROM Account AS A
WHERE AccountTypeID BETWEEN 6 AND 9;