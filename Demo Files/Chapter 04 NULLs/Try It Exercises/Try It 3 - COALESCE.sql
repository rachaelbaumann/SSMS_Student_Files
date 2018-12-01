USE RetailBankingSample;

--Step #3
SELECT E.EmployeeID, E.FirstName, E.LastName
FROM Employee AS E
;

--Step #4
SELECT E.EmployeeID, E.FirstName, E.LastName
	, COALESCE(E.Salary, E.HourlyRate * 2080
						, E.FixedRate * E.FixedRateAnnualCount)
	  AS AnnualPay
FROM Employee AS E
;
