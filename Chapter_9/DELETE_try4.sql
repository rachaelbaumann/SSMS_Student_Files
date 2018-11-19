USE RetailBankingSample;

-- Start with step 4 of Try 3
SELECT C.CustomerID, C.StateProvinceCode
	, CE.OpeningDate, SWITCHOFFSET(OpeningDateOffset, '-08:00')
FROM CustomerAccountExtended AS CE
	INNER JOIN Customer AS C
	ON C.CustomerID = CE.CustomerID
WHERE C.StateProvinceCode = 'CA'
;

--Start with step 7 from Try 3
SELECT C.CustomerID, C.StateProvinceCode
	, CE.OpeningDate, CE.OpeningDateOffset
FROM CustomerAccountExtended AS CE
	INNER JOIN Customer AS C
	ON C.CustomerID = CE.CustomerID
WHERE C.StateProvinceCode = 'CA'
;

-- Execute a TRUNCATE TABLE command to empty the CustomerAccountExtended table, then ROLLBACK
BEGIN TRANSACTION
TRUNCATE TABLE CustomerAccountExtended;

SELECT * FROM CustomerAccountExtended;

ROLLBACK;

-- Write a query that will return the rows in the CAE table that have an OpeningBalance of 0 in 
-- the Account table
SELECT CAE.CustomerID, CAE.AccountNumber, A.OpeningBalance
FROM CustomerAccountExtended AS CAE
	INNER JOIN Account AS A
	ON A.AccountID = CAE.AccountID
	AND A.PrimaryCustomerID = CAE.CustomerID
WHERE OpeningBalance = 0;

-- Write a query that will execute from inside of a transaction that will delete all Customers from 
-- the CAE table where OpeningBalance = 0 in the Account table.
BEGIN TRANSACTION 
DELETE FROM CustomerAccountExtended
FROM CustomerAccountExtended AS CAE
	INNER JOIN Account AS A
	ON A.AccountID = CAE.AccountID
	AND A.PrimaryCustomerID = CAE.CustomerID
WHERE OpeningBalance = 0;

-- Write a SELECT statement to verify the results and COMMIT the transaction
SELECT * FROM CustomerAccountExtended AS CAE
	INNER JOIN Account AS A
	ON A.AccountID = CAE.AccountID
	AND A.PrimaryCustomerID = CAE.CustomerID
WHERE OpeningBalance = 0;
COMMIT