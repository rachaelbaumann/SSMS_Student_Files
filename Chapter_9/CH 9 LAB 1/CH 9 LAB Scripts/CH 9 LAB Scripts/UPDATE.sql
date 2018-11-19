USE HealthCareSample;

SELECT PatientID, VisitCount,
	CASE
	WHEN VisitCount <= 10 THEN 'Low'
	WHEN VisitCount <= 50 THEN 'Moderate'
	WHEN VisitCount <= 100 THEN 'High'
	ELSE 'Very High'
	END AS VisitGroup
FROM OutpatientVisitSummary
ORDER BY VisitGroup;