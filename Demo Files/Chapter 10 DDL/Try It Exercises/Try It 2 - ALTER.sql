--Step #2
USE RetailBankingSample;

--Step #3
BEGIN TRANSACTION;

ALTER TABLE MyTransactions
	ADD ImportedDate datetime2
;

--COMMIT;


--Step #4
BEGIN TRANSACTION
UPDATE MyTransactions
	SET ImportedDate = SYSDATETIME()
;

SELECT * FROM MyTransactions;
--COMMIT;

--Step #5
ALTER TABLE MyTransactions
ALTER COLUMN TransactionDate datetimeoffset
;
