USE HealthCareSample;

SELECT PatientID, FirstName, LastName, DateofBirth
	, VisitCount 
FROM ##PatientVisitSummary
WHERE DATEDIFF(YY, DateofBirth, GetDate()) <= 30
	AND VisitCount >= 15
;