USE RetailBankingSample;

SELECT E.EmployeeID, E.FirstName, E.LastName,
	COALESCE(E.Salary, E.HourlyRate * 2080, E.FixedRate * E.FixedRateAnnualCount) AS [Annual Pay]
FROM Employee AS E;