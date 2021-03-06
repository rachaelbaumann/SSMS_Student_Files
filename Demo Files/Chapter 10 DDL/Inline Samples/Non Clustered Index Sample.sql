/*
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
*/

USE RetailBankingSample;

SELECT AccountTransactionID, Amount
	, A.AccountID, A.PrimaryCustomerID
	, A.OpeningBalance, A.OpeningDate
FROM AccountTransaction  AS AT
	INNER JOIN Account AS A
	ON AT.AcctID = A.AccountID
WHERE TransactionDate > '20180101'
;

/*  Statistics before the index is created - Hash Match JOIN performed
(3496 row(s) affected)
Table 'Workfile'. Scan count 0, logical reads 0, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'Worktable'. Scan count 0, logical reads 0, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'AccountTransaction'. Scan count 1, logical reads 516, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'Account'. Scan count 1, logical reads 4, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
*/

--Run the create index statement and then run the SELECT statement again
CREATE NONCLUSTERED INDEX 
	nc_AccountTransaction_AcctID_2017
	ON AccountTransaction (AcctID)
	INCLUDE (AMOUNT)
	WHERE TransactionDate > '20180101'
;

/* Statistics after the index is created - Merge JOIN performed
(3496 row(s) affected)
Table 'AccountTransaction'. Scan count 1, logical reads 12, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
Table 'Account'. Scan count 1, logical reads 4, physical reads 0, read-ahead reads 0, lob logical reads 0, lob physical reads 0, lob read-ahead reads 0.
*/