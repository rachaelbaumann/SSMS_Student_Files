USE HealthCareSample;

SELECT COUNT(DISTINCT(PatientID)) AS NewPatientCount
	, DATEPART(yy, FirstVisit)
FROM ##PatientVisitSummary 
GROUP BY DATEPART(yy,FirstVisit)
;