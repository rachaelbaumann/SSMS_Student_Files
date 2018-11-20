USE RetailBankingSample;

CREATE TABLE MyTransactions
	(NewTranKey int PRIMARY KEY IDENTITY (1, 1),
	BusinessTranKey int,
	AcctID int,
	Amount numeric(16, 6),
	TransactionType varchar(25),
	TransactionDate date
	);