USE RetailBankingSample;

SELECT A.AccountID, A.AccountTypeID
	, A.OpeningBalance, A.OpeningDate
FROM Account AS A
WHERE AccountTypeID IN (1,3,4,13,14)
	AND OpeningDate BETWEEN '20100101'  AND '20181231 23:59:59'
ORDER BY OpeningDate
;

