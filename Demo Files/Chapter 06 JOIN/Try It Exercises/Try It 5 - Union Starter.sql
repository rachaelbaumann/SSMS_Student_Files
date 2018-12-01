USE RetailBankingSample;


SELECT CT.AcctID, CT.Amount, CT.TransactionDate
FROM CreditTransaction AS CT;


SELECT LT.AcctID, LT.TransactionDate, LT.Amount
FROM LoanTransaction AS LT;


SELECT CONVERT(varchar(8),AT.AcctID)
	+ ' / ' + CONVERT(varchar(20), AT.Amount, 1)
	+ ' / ' + CONVERT(varchar(30), AT.TransactionDate, 109) AS TransactionDate
FROM AccountTransaction AS AT
;
