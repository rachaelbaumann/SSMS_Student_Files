USE RetailBankingSample;

SELECT AT.AcctID, AT.TransactionDate, AT.Amount
FROM AccountTransaction AS AT
WHERE AT.TransactionDate = (SELECT MAX(InnerAT.TransactionDate)
							FROM AccountTransaction AS InnerAT);

