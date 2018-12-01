--Step #2
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

--Step #4
SELECT CT.CreditTrxID, CT.Amount, CT.TransactionDate
	, C.FirstName, C.LastName
FROM CreditTransaction AS CT
	INNER JOIN Account AS A
	ON A.AccountID = CT.AcctID
	INNER JOIN Customer AS C
	ON A.PrimaryCustomerID = C.CustomerID
;

--Step #7
SELECT CT.CreditTrxID, CT.Amount, CT.TransactionDate
	, C.FirstName, C.LastName
FROM CreditTransaction AS CT
	INNER JOIN Account AS A
	ON A.AccountID = CT.AcctID
	INNER JOIN Customer AS C
	ON A.PrimaryCustomerID = C.CustomerID
WHERE CT.TransactionDate BETWEEN '20170101' AND '20170228'
;

--Step #18 Cleanup
DROP INDEX nc_CreditTransaction_AcctID ON dbo.CreditTransaction;
DROP INDEX nc_CreditTransaction_TransactionDate ON dbo.CreditTransaction;
