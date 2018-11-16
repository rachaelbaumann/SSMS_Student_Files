USE HealthCareSample;

SELECT S.FirstName, S.LastName, S.StaffType, S.HireDate,
	   M.FirstName, M.LastName, M.StaffType, M.HireDate
FROM Staff AS S
	LEFT OUTER JOIN Staff AS M
	ON S.StaffReportsTo = M.StaffID;