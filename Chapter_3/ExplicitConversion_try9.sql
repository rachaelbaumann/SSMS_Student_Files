USE RetailBankingSample;

SELECT AccountID,
	-- shows full year
	CONVERT(varchar(20), OpeningDate, 112) AS [Style 112 ISO],
	-- shows 2 digits in year
	CONVERT(varchar(20), OpeningDate, 12) AS [Style 12 ISO],
	-- shows style as mmm dd yyyy
	CONVERT(varchar(20), OpeningDate, 107) AS [mmmm dd yyyy],
	--
	CONVERT(varchar(4), OpeningDate, 12) AS [Truncated ISO]
FROM Account;