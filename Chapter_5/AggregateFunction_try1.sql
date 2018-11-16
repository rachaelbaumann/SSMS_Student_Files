USE RetailBankingSample;

SELECT MIN(LT.Amount) AS [Min Value],
	   MAX(LT.Amount) AS [Max Value],
	   AVG(LT.Amount) AS [Avg Value],
	   SUM(LT.Amount) AS [Total]
FROM LoanTransaction AS LT
GROUP BY LT.AcctID;

SELECT COUNT(*) AS [Employee Count],
	   COUNT(E.Salary) AS [Salary Employee Count],
	   COUNT(E.HourlyRate) AS [Hourly Employee Count],
	   COUNT(E.FixedRate) AS [Fixed Rate Employee Count]
FROM Employee AS E
GROUP BY Title
HAVING COUNT(*) > 10;