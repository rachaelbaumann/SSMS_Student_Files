USE RetailBankingSample;

--Try It 1 Step #5
SELECT MIN(LT.Amount) AS MinimumValue
	, MAX(LT.Amount) AS MaximumValue
	, AVG(LT.Amount) AS Average
	, SUM(LT.Amount) AS Total
FROM LoanTransaction AS LT
;

--Try It 1 Step #6
SELECT  COUNT(*) AS EmployeeCount
	, COUNT(E.Salary) AS SalaryEmployeeCount
	, COUNT(E.HourlyRate) AS HourlyEmployeeCount
	, COUNT(E.FixedRate) AS FixedRateEmployeeCount
FROM Employee AS E
;