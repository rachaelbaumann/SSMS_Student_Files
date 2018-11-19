USE HealthCareSample;

-- Return columns from OV table where VisitDate has a value
SELECT OV.PatientID, OV.VisitID, OV.VisitDate, OV.StaffID1, 
	   YEAR(OV.VisitDate) AS [Year]
FROM OutpatientVisit AS OV
WHERE OV.VisitDate IS NOT NULL;

-- Use query from above AS FROM CLAUSE
-- Return the number of annual visits per patient ID
SELECT Yearly.PatientID, VisitYear, 
	   COUNT(*) AS [Visits]
FROM (SELECT OV.PatientID, OV.VisitID, OV.VisitDate, OV.StaffID1, 
	   YEAR(OV.VisitDate) AS VisitYear
FROM OutpatientVisit AS OV
WHERE OV.VisitDate IS NOT NULL
	 ) AS Yearly
GROUP BY Yearly.PatientID, Yearly.VisitYear;