USE RetailBankingSample;

-- last name starts with A
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
WHERE LastName LIKE 'A%';

-- last name starts with A-D
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
WHERE LastName LIKE '[A-D]%';

--third letter in last name is d
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
WHERE LastName LIKE '__d%';