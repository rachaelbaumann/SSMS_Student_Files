USE HealthCareSample;

-- Return a table with columns and aggregates
SELECT P.PatientID, P.FirstName, P.LastName, P.DateofBirth,
	   COUNT(OV.VisitID) AS VisitCount,
	   MIN(OV.VisitDate) AS FirstVisit,
	   MAX(OV.VisitDate) AS LastVisit
FROM Patient AS P
	INNER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
GROUP BY P.PatientID, P.FirstName, P.LastName, P.DateofBirth;
-- QUESTION: How do we know when to use GROUP BY? It doesn't work without it
-- and I do not know why.

-- Change the SELECT statement to use the INTO clause to create a new global 
-- temporary table named '##PatientVisitSummary'
SELECT P.PatientID, P.FirstName, P.LastName, P.DateofBirth,
	   COUNT(OV.VisitID) AS VisitCount,
	   MIN(OV.VisitDate) AS FirstVisit,
	   MAX(OV.VisitDate) AS LastVisit
INTO ##PatientVisitSummary -- Add INTO statement to create temptable
FROM Patient AS P
	INNER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
GROUP BY P.PatientID, P.FirstName, P.LastName, P.DateofBirth;