USE HealthCareSample;

SELECT OV.PatientID,
	   OV.VisitDate,
	   DATEPART(yyyy, OV.VisitDate) AS [Year], 
	   OV.ClinicCode,
	   COUNT(*) OVER (PARTITION BY OV.PatientID) AS [Visit Count],
	   COUNT(*) OVER (PARTITION BY PatientID, DATEPART(yyyy, OV.VisitDate)) AS [Visit Count by Year]
FROM OutpatientVisit AS OV;