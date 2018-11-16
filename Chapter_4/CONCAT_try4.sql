USE RetailBankingSample;

SELECT CONCAT(RTRIM(C.FirstName),' ', C.MiddleName + ' ', RTRIM(C.LastName)) AS [Full Name]
FROM Customer AS C;