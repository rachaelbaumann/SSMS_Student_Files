USE RetailBankingSample;

SELECT C.CustomerID, C.FirstName, C.LastName
	, C.City, C.StateProvinceCode
FROM Customer AS C
WHERE StateProvinceCode <> '*M'
;