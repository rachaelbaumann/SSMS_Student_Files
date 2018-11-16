USE HealthCareSample;

SELECT OV.PatientID,
	   COUNT(*) AS [# of Visits],
	   COUNT(OV.ICD10_2) AS [# of Visits with ICD10_2 Codes]
FROM OutpatientVisit AS OV
WHERE OV.VisitDate >= '20160101'
GROUP BY OV.PatientID
HAVING COUNT(OV.ICD10_2) > 0;