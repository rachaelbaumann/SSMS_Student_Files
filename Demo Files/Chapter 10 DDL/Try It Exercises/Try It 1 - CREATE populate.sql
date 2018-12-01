--Step #5
USE RetailBankingSample;

INSERT INTO MyTransactions 
	(	BusinessTranKey, AcctID, Amount
	, TransactionType, TransactionDate)
	SELECT LoanTransactionID, AcctID, Amount
		, TransactionType, TransactionDate
	FROM LoanTransaction
	UNION ALL
	SELECT AccountTransactionID, AcctID, Amount
		, TransactionType, TransactionDate
	FROM AccountTransaction
	UNION ALL
	SELECT CreditTrxID, AcctID, Amount
		, TransactionType, TransactionDate
	FROM CreditTransaction
;

SELECT * FROM MyTransactions;


