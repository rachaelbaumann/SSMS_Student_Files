USE RetailBankingSample;

SELECT A.AccountID, A.OpeningDate
	, DATEPART(yyyy,A.OpeningDate) AS OpeningYear
	--, YEAR(A.OpeningDate) AS OptionalOpeningYear
	, DATENAME(mm, A.OpeningDate) AS OpeningMonth
	, DATEPART(dd,A.OpeningDate) AS OpeningDayofMonth
	, DATENAME(dw,A.OpeningDate) AS OpeningDayofWeek
FROM Account AS A
;