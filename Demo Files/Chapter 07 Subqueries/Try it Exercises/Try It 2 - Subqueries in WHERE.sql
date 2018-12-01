USE RetailBankingSample;

--Step #2
SELECT MAX(InnerAT.TransactionDate)
FROM AccountTransaction AS InnerAT


--Step #4
SELECT AT.AcctID, AT.TransactionDate, AT.Amount
FROM AccountTransaction AS AT

--Step #5
SELECT AT.AcctID, AT.TransactionDate, AT.Amount
FROM AccountTransaction AS AT
WHERE AT.TransactionDate = (SELECT MAX(InnerAT.TransactionDate)
											  FROM AccountTransaction AS InnerAT
											) 
;											

--Step #6
SELECT AT.AcctID, AT.TransactionDate, AT.Amount
FROM AccountTransaction AS AT
WHERE AT.TransactionDate = (SELECT MAX(InnerAT.TransactionDate)
											  FROM AccountTransaction AS InnerAT
											  WHERE InnerAT.AcctID = AT.AcctID
											) 
ORDER BY AT.AcctID
;	


