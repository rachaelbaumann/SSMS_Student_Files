USE RetailBankingSample;

-- write a transaction to drop the table MyTransactions
BEGIN TRANSACTION
DROP TABLE MyTransactions
COMMIT;

ROLLBACK;

SELECT * FROM MyTransactions;