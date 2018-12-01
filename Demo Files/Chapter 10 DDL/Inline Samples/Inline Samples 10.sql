USE RetailBankingSample;

--CREATE TABLE
CREATE TABLE NewUsers
	(UserID int IDENTITY PRIMARY KEY NOT NULL
		, FirstName varchar(20) NOT NULL
		, MiddleName varchar(20) NULL
		, LastName varchar(20) NOT NULL
	)
; 

--ALTER TABLE
ALTER TABLE NewUsers
	ALTER COLUMN FirstName varchar(50)
;


ALTER TABLE NewUsers
	ADD Title varchar(20) NULL
;


SELECT * FROM NewUsers;


--DROP TABLE
DROP TABLE NewUsers;

--CREATE non clustered index
CREATE NONCLUSTERED INDEX 
	nc_AccountTransaction_AcctID_2017
	ON AccountTransaction (AcctID)
	INCLUDE (AMOUNT)
	WHERE TransactionDate > '20180101'
;

DROP INDEX nc_AccountTransaction_AcctID_2017
	ON AccountTransaction
;