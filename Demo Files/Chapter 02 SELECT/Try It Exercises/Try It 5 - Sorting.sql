USE RetailBankingSample;

SELECT C.CustomerID, C.City, C.StateProvinceCode
FROM Customer AS C
ORDER BY C.StateProvinceCode DESC, C.City ASC --ASC is optional here
;