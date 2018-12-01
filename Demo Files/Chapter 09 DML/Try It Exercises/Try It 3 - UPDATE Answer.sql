USE RetailBankingSample;

--Step #3
SELECT C.CustomerID, C.StateProvinceCode
	, CE.OpeningDate, CE.OpeningDateOffset
FROM CustomerAccountExtended AS CE
	INNER JOIN Customer AS C
	ON C.CustomerID = CE.CustomerID
WHERE C.StateProvinceCode = 'CA'
;

--Step #4
SELECT C.CustomerID, C.StateProvinceCode
	, CE.OpeningDate, SWITCHOFFSET(OpeningDateOffset, '-08:00')
FROM CustomerAccountExtended AS CE
	INNER JOIN Customer AS C
	ON C.CustomerID = CE.CustomerID
WHERE C.StateProvinceCode = 'CA'
;


--Step #5
BEGIN TRANSACTION

--Step #6
UPDATE CustomerAccountExtended
SET OpeningDateOffset = SWITCHOFFSET(OpeningDateOffset, '-08:00')
FROM CustomerAccountExtended AS CE
	INNER JOIN Customer AS C
	ON C.CustomerID = CE.CustomerID
WHERE C.StateProvinceCode = 'CA'
;

--Step #7
SELECT C.CustomerID, C.StateProvinceCode
	, CE.OpeningDate, CE.OpeningDateOffset
FROM CustomerAccountExtended AS CE
	INNER JOIN Customer AS C
	ON C.CustomerID = CE.CustomerID
WHERE C.StateProvinceCode = 'CA'
;

--Step #8 - remove the comment markers and execute the appropriate option.
--COMMIT
--ROLLBACK

--Use the following command to see if you still have any open transactions.
SELECT @@TRANCOUNT