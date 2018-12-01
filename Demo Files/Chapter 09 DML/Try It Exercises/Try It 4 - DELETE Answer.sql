USE RetailBankingSample;

--Step #3
BEGIN TRANSACTION;
TRUNCATE TABLE CustomerAccountExtended;

--Step #4
SELECT * FROM CustomerAccountExtended;
ROLLBACK;

--Step #5
SELECT CE.CustomerID, CE.AccountNumber
	, A.OpeningBalance
FROM CustomerAccountExtended AS CE
	INNER JOIN Account AS A
	ON A.AccountID = CE.AccountID
	AND A.PrimaryCustomerID = CE.CustomerID
WHERE OpeningBalance = 0
;

--Step #6
BEGIN TRANSACTION;
DELETE FROM CustomerAccountExtended
FROM CustomerAccountExtended AS CE
	INNER JOIN Account AS A
	ON A.AccountID = CE.AccountID
	AND A.PrimaryCustomerID = CE.CustomerID
WHERE OpeningBalance = 0
;

--Step #7
SELECT * 
FROM CustomerAccountExtended AS CE
	INNER JOIN Account AS A
	ON A.AccountID = CE.AccountID
	AND A.PrimaryCustomerID = CE.CustomerID
WHERE OpeningBalance = 0
;

COMMIT;