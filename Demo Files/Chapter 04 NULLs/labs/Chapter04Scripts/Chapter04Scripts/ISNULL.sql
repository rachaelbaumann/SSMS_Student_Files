USE HealthCareSample;

--Step #8
SELECT PatientID, FirstName, LastName 
	--, Race
FROM Patient
WHERE Race IS NULL
	OR Race = 'Other'
;

--Step #8
SELECT PatientID, FirstName, LastName 
	--, Race
FROM Patient
WHERE Race IS NULL
	OR Race = 'Other'
;

--Step #10
SELECT PatientID, FirstName, LastName 
	, ISNULL(Race, 'Blank') AS [Race Not Listed]
FROM Patient
WHERE Race IS NULL
	OR Race = 'Other'
;
