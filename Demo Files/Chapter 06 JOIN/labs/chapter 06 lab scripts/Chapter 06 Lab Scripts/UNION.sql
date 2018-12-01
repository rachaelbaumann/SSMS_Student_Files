USE HealthCareSample;

--Step #3a
SELECT P.FirstName, P.LastName, P.ZipCode
	, 'Patient' AS PersonType
FROM Patient AS P;
;

--Step #3b
SELECT S.FirstName, S.LastName, S.StaffType
FROM Staff AS S;

--Step #4
SELECT P.FirstName, P.LastName, P.ZipCode
	, 'Patient' AS PersonType
FROM Patient AS P
UNION ALL
SELECT S.FirstName, S.LastName
    , 'Not available' --literal to fill in zipcode 
	, S.StaffType
FROM Staff AS S;