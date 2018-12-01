USE RetailBankingSample;

--ROLLUP and CUBE - CUBE option -with GROUPING function
SELECT ReportsTo
	,  CASE
			WHEN GROUPING(E.ReportsTo) = 1 THEN 'ReportTo Summary'
			ELSE 'ReportsTo Detail'
	   END AS ReportsToGrouping
	, E.Title
	, CASE
			WHEN GROUPING(E.Title) = 1 THEN 'Title Summary'
			ELSE 'Title Detail'
	   END AS  TitleGrouping
	, COUNT(*) AS EmployeeCount
FROM Employee AS E
GROUP BY CUBE (E.ReportsTo, E.Title)
ORDER BY E.ReportsTo, E.Title
;


--OVER with RANGE clause
--This sample requires the creation of a temporary table with monthly
--totals - the temporary table will remain active in this session until dropped
--or the session is closed.
SELECT DATENAME(MM, AT.TransactionDate) + ' ' 
		+ CONVERT(char(4), DATEPART(yyyy, AT.TransactionDate)) AS [Month]
	, SUM(AT.Amount) AS TotalAmount
	, CONVERT(varchar(8), DATEPART(yyyy, AT.TransactionDate)) 
					+ RIGHT('00' + CONVERT(varchar(8), DATEPART(MM, AT.TransactionDate)) , 2)
		AS OrderingDate
INTO #MonthlyTotals
FROM AccountTransaction AS AT
GROUP BY DATENAME(MM, AT.TransactionDate) + ' ' 
					+ CONVERT(char(4), DATEPART(yyyy, AT.TransactionDate))
		, CONVERT(varchar(8), DATEPART(yyyy, AT.TransactionDate)) 
					+ RIGHT('00' + CONVERT(varchar(8), DATEPART(MM, AT.TransactionDate)) , 2)
;


--Test new temp table
SELECT * FROM #MonthlyTotals ORDER BY OrderingDate;

--Retrieve 3 month moving average
SELECT [Month], TotalAmount
	,AVG(TotalAmount) 
	   OVER (ORDER BY OrderingDate ROWS BETWEEN 2 PRECEDING AND CURRENT ROW)
		AS [3 month average]
FROM #MonthlyTotals
;

--Cleanup
/*
DROP TABLE #MonthlyTotals
*/