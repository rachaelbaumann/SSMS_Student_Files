USE HealthCareSample;

SELECT P.PatientID, P.FirstName, P.LastName, P.Race
FROM Patient AS P
WHERE Race IS NULL
	OR Race = 'other';