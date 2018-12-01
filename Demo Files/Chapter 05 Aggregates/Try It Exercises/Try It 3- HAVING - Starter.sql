USE RetailBankingSample;

--TI 1 Step #5
SELECT MIN(LT.Amount) AS MinimumValue
	, MAX(LT.Amount) AS MaximumValue
	, AVG(LT.Amount) AS Average
	, SUM(LT.Amount) AS Total
FROM LoanTransaction AS LT
;

--TI 1 Step #6
SELECT  COUNT(*) AS EmployeeCount
	, COUNT(E.Salary) AS SalaryEmployeeCount
	, COUNT(E.HourlyRate) AS HourlyEmployeeCount
	, COUNT(E.FixedRate) AS FixedRateEmployeeCount
FROM Employee AS E
;

--TI 2 Step #3
SELECT LT.AcctID
	, MIN(LT.Amount) AS MinimumValue
	, MAX(LT.Amount) AS MaximumValue
	, AVG(LT.Amount) AS Average
	, SUM(LT.Amount) AS Total
FROM LoanTransaction AS LT
GROUP BY LT.AcctID
;

--TI 2 Step #4
SELECT  Title
	, COUNT(*) AS EmployeeCount
	, COUNT(E.Salary) AS SalaryEmployeeCount
	, COUNT(E.HourlyRate) AS HourlyEmployeeCount
	, COUNT(E.FixedRate) AS FixedRateEmployeeCount
FROM Employee AS E
GROUP BY Title
;