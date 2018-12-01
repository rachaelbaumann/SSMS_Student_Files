USE RetailBankingSample;

--Step #3
SELECT AT.AccountTransactionID, AT.Amount
	, ROUND(AT.Amount, 1, 0) AS RoundedDefaultToTenths
	, ROUND(AT.Amount, 1, 1) AS TruncatedToTenths
	, ROUND(AT.Amount, 0) AS RoundedDefaultToWholeNumbers
	, ROUND(AT.Amount, 0,1) AS TruncatedToWholeNumbers
	, ROUND(AT.Amount, -1) AS RoundedDefaultToTens
	, ROUND(AT.Amount, -1,1) AS TruncatedToTens
FROM AccountTransaction AS AT
;

--Step #4
SELECT AT.AccountTransactionID, AT.Amount
	, ROUND(AT.Amount, 1, 0) AS RoundedDefaultToTenths
	, ROUND(AT.Amount, 1, 1) AS TruncatedToTenths
	, ROUND(AT.Amount, 0) AS RoundedDefaultToWholeNumbers
	, ROUND(AT.Amount, 0,1) AS TruncatedToWholeNumbers
	, ROUND(AT.Amount, -1) AS RoundedDefaultToTens
	, ROUND(AT.Amount, -1,1) AS TruncatedToTens
	, CEILING(AT.Amount) AS CeilingValue
	, FLOOR(AT.Amount) AS FloorValue
FROM AccountTransaction AS AT
;