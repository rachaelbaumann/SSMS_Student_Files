USE RetailBankingSample;

-- get all the data in the Accounts table (order by interest rate)
SELECT * FROM Account 
ORDER BY InterestRate;

-- Take the sum and averages of the OpeningBalance, CreditLimit, and InterestRate
SELECT SUM(OpeningBalance) AS [Total Opening Balance],
	   AVG(OpeningBalance) AS [Average Opening Balance],

	   SUM(CreditLimit) AS [Total Credit Limit],
	   AVG(CreditLimit) AS [Average Credit Limit],

	   SUM(InterestRate) AS [Total Interest Rate],
	   AVG(InterestRate) AS [Average Interest Rate]
From Account;

