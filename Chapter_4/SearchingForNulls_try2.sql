USE RetailBankingSample;

SELECT C.CustomerID, C.FirstName, C.MiddleName, C.LastName
FROM Customer AS C
WHERE C.MiddleName IS NOT NULL;