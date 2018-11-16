USE RetailBankingSample;

SELECT A.AccountID, 
	A.OpeningDate,
	YEAR(A.OpeningDate) AS [Opening Year],
	--MONTH(A.OpeningDate) AS [Opening Month]
	DATENAME(MONTH, A.OpeningDate) AS [Opening Month],
	DAY(A.OpeningDate) AS [Opening Day of Month],
	DATENAME(DW, A.OpeningDate) AS [Opening Day of Week]
FROM Account AS A;

-- OR you can do this for consistency

SELECT A.AccountID, 
	A.OpeningDate,
	DATEPART(yyyy, A.OpeningDate) AS [Opening Year],
	DATENAME(mm, A.OpeningDate) AS [Opening Month],
	DATEPART(dd, A.OpeningDate) AS [Opening Day of Month],
	DATENAME(dw, A.OpeningDate) AS [Opening Day of Week]
FROM Account AS A;