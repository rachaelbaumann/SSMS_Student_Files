USE HealthCareSample;

SELECT SM.FirstName, SM.LastName, SM.StaffType
	, SM.HireDate, SM.StaffReportsTo
	, SRT.FirstName, SRT.LastName, SRT.StaffType
	, SRT.HireDate
FROM Staff AS SM
	LEFT OUTER JOIN Staff AS SRT
	ON SM.StaffReportsTo = SRT.StaffID
;