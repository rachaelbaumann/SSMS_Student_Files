USE RetailBankingSample;

--Step #3
SELECT A.AccountID, A.OpeningDate, A.OpeningBalance
FROM Account AS A
WHERE A.OpeningDate >= '20120101'
;

--Step #4
SELECT A.AccountID, A.OpeningDate, A.OpeningBalance
FROM Account AS A
WHERE A.OpeningBalance > 10000
	AND A.OpeningDate >= '20120101'
;

