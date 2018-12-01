USE RetailBankingSample;

SELECT C.CustomerID, C.FirstName, C.LastName
	, C.City, C.StateProvinceCode
	, COUNT(*) OVER (PARTITION BY C.StateProvinceCode)
		AS SameStateCustomerCount
FROM Customer AS C
WHERE StateProvinceCode <> '*M'
;