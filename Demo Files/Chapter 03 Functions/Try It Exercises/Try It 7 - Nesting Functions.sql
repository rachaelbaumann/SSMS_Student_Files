USE RetailBankingSample;

--Step #2
SELECT A.AccountID, A.OpeningDate
FROM Account AS A
;

--Step #3
SELECT A.AccountID, A.OpeningDate
	, DATENAME(dd,A.OpeningDate) AS DayChar
FROM Account AS A
;


--Step #4
SELECT A.AccountID, A.OpeningDate
	, '0' + DATENAME(dd,A.OpeningDate) AS DayChar
FROM Account AS A
;

--Step #5
SELECT A.AccountID, A.OpeningDate
	, RIGHT('0' + DATENAME(dd,A.OpeningDate), 2) AS DayChar
FROM Account AS A
;