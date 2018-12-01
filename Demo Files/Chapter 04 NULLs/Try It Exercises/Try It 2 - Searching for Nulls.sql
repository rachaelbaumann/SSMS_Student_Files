--Step #1
USE RetailBankingSample;

--Step #3
SELECT C.CustomerID, C.FirstName, C.MiddleName
	, C.LastName
FROM Customer AS C
WHERE C.MiddleName = NULL;

--Step #4
SELECT C.CustomerID, C.FirstName, C.MiddleName
	, C.LastName
FROM Customer AS C
WHERE C.MiddleName IS NULL;

--Step #5
SELECT C.CustomerID, C.FirstName, C.MiddleName
	, C.LastName
FROM Customer AS C
WHERE C.MiddleName IS NOT NULL;