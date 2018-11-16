USE HealthCareSample;

SELECT P.PatientID, P.FirstName, P.LastName,
	ISNULL(P.Race, 'Blank') AS [Race Not Listed]
FROM Patient AS P
WHERE P.Race IS NULL OR P.Race = 'other';