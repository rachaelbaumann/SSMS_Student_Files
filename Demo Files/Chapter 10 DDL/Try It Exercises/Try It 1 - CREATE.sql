USE RetailBankingSample;

--Step #3
CREATE TABLE MyTransactions
	(NewTranKey int PRIMARY KEY IDENTITY (1,1)
	 , BusinessTranKey int
	 , AcctID int
	 , Amount numeric (16,6)
	 , TransactionType varchar(20)
	 , TransactionDate date
	)
;

