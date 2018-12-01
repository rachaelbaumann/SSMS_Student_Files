USE HealthCareSample;

--Step #4
SELECT PatientID, FirstName, LastName 
	--, Race
FROM Patient
WHERE Race IS NULL
;

--Step #5
SELECT PatientID, FirstName, LastName 
	--, Race
FROM Patient
WHERE Race IS NULL
	OR Race = 'Other'
;
