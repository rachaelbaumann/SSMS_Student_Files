--Step #1(1)
USE RetailBankingSample;

-- Step #1(2)
SELECT *
FROM Account;

--Step 4(1)
SELECT SUM(OpeningBalance) AS TotalOpeningBalance
	, AVG(OpeningBalance) AS AvgOpeningBalance
	, SUM(CreditLimit) AS TotalCreditLimit
	, AVG(CreditLimit) AS AvgCreditLimit
	, SUM(InterestRate) AS TotalInterestRate
	, AVG(InterestRate) AS AverageIntRate
	, AVG(CONVERT(float, InterestRate)) AS ExcelAverageIntRate
FROM Account
WHERE AccountID > 280
;