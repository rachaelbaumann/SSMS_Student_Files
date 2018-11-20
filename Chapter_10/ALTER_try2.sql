USE RetailBankingSample;

-- Add a new column named ImportedDate of type datetime2 to the table, then commit change
BEGIN TRANSACTION
ALTER TABLE MyTransactions
	ADD ImportedDate datetime2
	;

COMMIT;

-- Use a transaction to update the current date and time (InsertedDate) as datetime2
BEGIN TRANSACTION
UPDATE MyTransactions
	SET ImportedDate = SYSDATETIME()
	;

COMMIT;

--Change the date type on TransactionDate to datetimeoffset
ALTER TABLE MyTransactions
ALTER COLUMN TransactionDate datetimeoffset;

SELECT * FROM MyTransactions;