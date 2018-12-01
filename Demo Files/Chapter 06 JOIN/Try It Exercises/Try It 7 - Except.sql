SELECT AT.AcctID, TransactionType
FROM AccountTransaction AS AT
WHERE TransactionDate BETWEEN '20170101' AND '20171231'
	AND TransactionType = 'ATM'
EXCEPT
SELECT AT.AcctID, TransactionType
FROM AccountTransaction AS AT
WHERE TransactionDate BETWEEN '20160101' AND '20161231'
	AND TransactionType = 'ATM'
;
