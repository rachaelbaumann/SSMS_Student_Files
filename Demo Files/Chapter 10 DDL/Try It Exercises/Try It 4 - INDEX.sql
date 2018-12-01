--Step #2
USE RetailBankingSample;

--Step #3
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

--Step #5
SELECT MT.NewTranKey, MT.Amount
FROM MyTransactions AS MT
WHERE TransactionType = 'Interest'
;

--Step #7
CREATE INDEX nc_MyTrans_TranType
	ON MyTransactions (TransactionType)
	INCLUDE (Amount)
;


