USE RetailBankingSample;

SELECT C.CustomerID, C.FirstName, C.LastName
	, C.City, C.StateProvinceCode
	-- group by state province code
	, COUNT(*) OVER (PARTITION BY C.StateProvinceCode) AS [Same ST Customer Ct]
FROM Customer AS C
WHERE StateProvinceCode <> '*M'
;