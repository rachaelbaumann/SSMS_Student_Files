USE RetailBankingSample;

SELECT AT.AcctID, AT.TransactionType
FROM AccountTransaction AS AT
WHERE TransactionDate BETWEEN '20170101' AND '20171231'
-- Make sure it returns only ATM transactions
	  AND TransactionType = 'ATM'
INTERSECT
SELECT AT.AcctID, AT.TransactionType
FROM AccountTransaction AS AT
WHERE TransactionDate BETWEEN '20160101' AND '20161231'
INTERSECT
SELECT AT.AcctID, AT.TransactionType
FROM AccountTransaction AS AT
WHERE TransactionDate BETWEEN '20150101' AND '20151231'
ORDER BY AcctID;