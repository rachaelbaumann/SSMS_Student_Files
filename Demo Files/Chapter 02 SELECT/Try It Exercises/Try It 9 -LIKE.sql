USE RetailBankingSample;

SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
WHERE LastName LIKE 'A%'
;

SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
WHERE LastName LIKE '[A-D]%'
;

--Note - there are two underscores even though they merge together
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
WHERE LastName LIKE '__d%'
;