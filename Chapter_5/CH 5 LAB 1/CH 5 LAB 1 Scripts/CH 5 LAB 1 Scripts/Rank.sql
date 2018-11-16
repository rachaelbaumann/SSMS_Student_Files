USE HealthCareSample;

SELECT OV.VisitID, OV.PatientID, OV.VisitDate, OV.ClinicCode,
-- order by how recently the visits were
	   DENSE_RANK() OVER (ORDER BY OV.VisitDate) AS [Rank],
-- group visits into 500 groups (every 89 ID's)
	   NTILE(500) OVER (ORDER BY OV.VisitDate) AS [Order by 500]
FROM OutpatientVisit AS OV;