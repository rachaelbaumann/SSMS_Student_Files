USE HealthCareSample;

SELECT P.FirstName, P.LastName, P.ZipCode, 'Patient' AS [Person Type]
FROM Patient AS P
UNION ALL
SELECT S.FirstName, S.LastName, 'Not Available', S.StaffType
FROM Staff AS S;