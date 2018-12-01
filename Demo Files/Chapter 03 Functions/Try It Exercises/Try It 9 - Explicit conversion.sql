USE RetailBankingSample;

--CONVERT function Sample
--Step #2
SELECT AccountID, CONVERT(varchar(20)
	, OpeningDate, 112) AS [Style 112 ISO]
FROM Account;

--Step #3
SELECT AccountID
	, CONVERT(varchar(20), OpeningDate, 112) AS [Style 112 ISO]
	, CONVERT(varchar(20), OpeningDate, 12) AS [Style 12 ISO]
FROM Account;

--Step #4
SELECT AccountID
	, CONVERT(varchar(20), OpeningDate, 112) AS [Style 112 ISO]
	, CONVERT(varchar(20), OpeningDate, 12) AS [Style 12 ISO]
	, CONVERT(varchar(20), OpeningDate, 107) AS [Mon dd yyyy]
	, CONVERT(varchar(4), OpeningDate, 12) AS [Truncated ISO]
FROM Account;

