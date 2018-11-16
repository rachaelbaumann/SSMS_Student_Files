USE RetailBankingSample;

SELECT CT.CreditTrxID, CT.AcctID, 
	ABS(CT.Amount) AS [Positive Amount]
FROM CreditTransaction AS CT
WHERE TransactionType = 'charge';