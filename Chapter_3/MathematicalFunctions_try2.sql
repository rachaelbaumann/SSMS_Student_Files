USE RetailBankingSample;

SELECT AT.AccountTransactionID, AT.Amount,
	ROUND(AT.Amount, 1, 0) AS RoundedDefault,
	ROUND(AT.Amount, 1, 1) AS Truncated,
	ROUND(AT.Amount, 0) AS RoundedDefaultToWholeNumbers,
	ROUND(AT.Amount, 0, 1) AS TruncatedToWholeNumbers,
	ROUND(AT.Amount, -1) AS RoundedDefaultToTens,
	ROUND(AT.Amount, -1, 1) AS TruncatedToTens,
	CEILING(AT.Amount) AS CeilingValue,
	FLOOR(AT.Amount) AS FloorValue
FROM AccountTransaction AS AT;