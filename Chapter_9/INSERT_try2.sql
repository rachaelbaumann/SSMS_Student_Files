USE RetailBankingSample;

-- Create new table CustomerAccountExtended
SELECT RTRIM(C.FirstName) + ' ' + C.LastName AS [Customer], C.CustomerID, 
	   CA.AccountNumber, 
	   A.AccountID, A.OpeningDate,
	   CONVERT(datetimeoffset, A.OpeningDate) AS OpeningDateOffset
INTO CustomerAccountExtended
FROM Customer AS C
	INNER JOIN CustomerAccount AS CA
	ON C.CustomerID = CA.CustomerID
	INNER JOIN Account AS A
	ON A.AccountID = CA.AccountID
ORDER BY C.CustomerID;

SELECT * FROM CustomerAccountExtended;

-- Inmsert values into new table
BEGIN TRANSACTION
INSERT INTO CustomerAccountExtended (CustomerID, Customer, AccountNumber, AccountID, OpeningDate)
VALUES (500, 'Katya Zamolodichikova', 'KZAMOL900', 900, '20181119');
SELECT * FROM CustomerAccountExtended
ORDER BY CustomerID DESC;

SELECT C.CustomerID, C.StateProvinceCode,
	   CAE.OpeningDate, CAE.OpeningDateOffset
FROM CustomerAccountExtended AS CAE
	INNER JOIN Customer AS C
	ON C.CustomerID = CAE.CustomerID
WHERE StateProvinceCode = 'CA';

-- Use SWITCFOFFSET to modify the current offset of the CA custom records to -8:00
SELECT C.CustomerID, C.StateProvinceCode,
	   CAE.OpeningDate, CAE.OpeningDateOffset,
	   SWITCHOFFSET(OpeningDateOffset, '-08:00')
FROM CustomerAccountExtended AS CAE
	INNER JOIN Customer AS C
	ON C.CustomerID = CAE.CustomerID
WHERE StateProvinceCode = 'CA';

-- Remove the SELECT from the query 2 above, and replace it with UPDATE and SET lines
-- required to modify the OpeningDateOffdet for all customers in CA.
BEGIN TRANSACTION
UPDATE CustomerAccountExtended
SET OpeningDateOffset = SWITCHOFFSET(OpeningDateOffset, '-08:00')
FROM CustomerAccountExtended AS CAE
	INNER JOIN Customer AS C
	ON C.CustomerID = CAE.CustomerID
WHERE C.StateProvinceCode = 'CA';

COMMIT

SELECT * FROM CustomerAccountExtended;