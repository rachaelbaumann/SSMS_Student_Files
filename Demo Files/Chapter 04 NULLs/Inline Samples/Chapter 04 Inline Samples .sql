USE RetailBankingSample;

--= vs IS NULL
SELECT * FROM Customer 
WHERE Birthdate IS NULL

--ISNULL function
SELECT CustomerID, ISNULL(MiddleName, '') AS [Middle Name]
FROM Customer;

--COALESCE
--sample 1 similar to ISNULL
SELECT CustomerID, COALESCE(MiddleName, '') AS [Middle Name]
FROM Customer;

--sample 2 additional functionality
USE PhishingSample;
SELECT L.LookupID, L.UserID
	, COALESCE(L.TimeReportedSpam
						, L.TimeOpened, '99991231')
			AS InitialActionTime
FROM [Lookup] AS L
;

--Extra bonus code to make this sample better
USE PhishingSample;
SELECT L.LookupID, L.UserID
	, COALESCE(L.TimeReportedSpam
						, L.TimeOpened, '99991231')
			AS InitialActionTime
	, CASE
		WHEN L.TimeReportedSpam IS NOT NULL
		THEN 'Time Reported'
		WHEN L.TimeReportedSpam IS NULL	
			AND L.TimeOpened IS NOT NULL
		THEN 'Time Opened'
		WHEN L.TimeReportedSpam IS NULL
			AND L.TimeOpened IS NULL
		THEN 'Neither opened nor reported'
		ELSE 'Something went wrong with the query'
	END AS TimeType
FROM [Lookup] AS L
;

USE RetailBankingSample;

--CONCAT
SELECT CONCAT(RTRIM(E.LastName), ', ', E.FirstName) AS [Full Name]
FROM Employee AS E
;