--Run the create table just once - DROP table at end of script under Cleanup.
CREATE TABLE TestTrans (PK_ID int identity, Col2 char(4))


BEGIN TRANSACTION outertran
INSERT INTO TestTrans VALUES ('a'), ('b');
SELECT * FROM TestTrans; --2 rows returned
SELECT @@TRANCOUNT --one open tran
SAVE TRAN HalfDone --create save point
INSERT INTO TestTrans VALUES ('c');
SELECT * FROM TestTrans; --3 rows returned
SELECT @@TRANCOUNT --still only one transaction
ROLLBACK TRAN HalfDone --rollback to save point removing the row with 'c'
SELECT @@TRANCOUNT  --rollback did not close transaction since it only rolled back to the savepoint
/*There is still an open transaction - if you don't commit,
 the first two rows will eventually roll back when the connection is lost. */
SELECT * FROM TestTrans -- only first 2 rows returned
COMMIT 
SELECT @@TRANCOUNT --no open transactions
SELECT * FROM TestTrans --still have the first 2 rows returned.

--Highlight and execute just line 24 to empty the TestTrans table and reset the identity value to 1
/*
TRUNCATE TABLE TestTrans;
*/

--Sample Nested Transactions 
BEGIN TRANSACTION outertran
INSERT INTO TestTrans VALUES ('a'), ('b');
SELECT * FROM TestTrans; --2 rows returned
SELECT @@TRANCOUNT --one open tran
BEGIN TRAN HalfDone --Open a 2nd transaction
INSERT INTO TestTrans VALUES ('c');
SELECT * FROM TestTrans; --3 rows returned
SELECT @@TRANCOUNT --now there are two open transactions
COMMIT TRAN Outertran --issue a commit command for the outer transaction (name is ignored - takes most recent tran to mark committed)
SELECT @@TRANCOUNT  -- back to one open tran
/*There is still an open transaction - if you don't commit,
 the first two rows will eventually roll back when the connection is lost. */
SELECT * FROM TestTrans -- all three rows are there.
ROLLBACK
SELECT @@TRANCOUNT --no open transactions
SELECT * FROM TestTrans --no rows left.  Everything was rolled back, all the way to the beginning


--Cleanup
/*
DROP TABLE TestTrans;
*/