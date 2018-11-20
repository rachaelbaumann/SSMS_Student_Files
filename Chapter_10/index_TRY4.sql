USE RetailBankingSample;

-- Enable statistics for both disk IO and CPU time
SET STATISTICS IO ON;
SET STATISTICS TIME ON;

-- Return columns from MT for transactions of type interest
SELECT MT.NewTranKey, MT.Amount
FROM MyTransactions AS MT
WHERE TransactionType = 'Interest';

-- Create a non-clustered index
CREATE INDEX nc_MyTransactions_TranType
	ON MyTransactions (TransactionType)
	INCLUDE (Amount);