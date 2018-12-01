USE RetailBankingSample;

--Step #4
SELECT CT.AcctID, CT.Amount, CT.TransactionDate
	, CT.TransactionType, 'Credit Transactions'
FROM CreditTransaction AS CT
UNION ALL
SELECT LT.AcctID, LT.Amount, LT.TransactionDate
	, LT.TransactionType, 'Loan Transactions'
FROM LoanTransaction AS LT
UNION ALL
SELECT AT.AcctID, AT.Amount, AT.TransactionDate
	, AT.TransactionType, 'Bank Account Transactions'
FROM AccountTransaction AS AT
ORDER by Amount DESC
;
