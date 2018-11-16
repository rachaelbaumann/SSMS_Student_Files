USE PhishingSample;

SELECT 
	U.EmailAddress,
	SUBSTRING(
	U.EmailAddress,
	CHARINDEX('.', U.EmailAddress) + 1,
	(CHARINDEX('@', U.EmailAddress) - CHARINDEX('.', U.EmailAddress)) - 1
	) AS [Last Name]
FROM [User] AS U;