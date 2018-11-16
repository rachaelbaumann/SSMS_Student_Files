USE RetailBankingSample;

SELECT A.AccountID, A.OpeningDate,
-- get the right 2 characters
	RIGHT('0' + DATENAME(dd, A.OpeningDate), 2) AS [DayChar]
FROM Account AS A;