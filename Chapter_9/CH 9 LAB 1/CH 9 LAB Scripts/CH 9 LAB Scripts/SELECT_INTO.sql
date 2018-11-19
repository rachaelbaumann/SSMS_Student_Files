USE HealthCareSample;

-- CREATE A TABLE THIS WAY
--Create a new permanent table named OutpatientVisitSummary
CREATE TABLE OutpatientVisitSummary
	(PatientID int, FirstName varchar(20), LastName varchar(25), VisitCount int,
	 MostRecentVisit datetime2, FirstVisit datetime2, [State] varchar(2), 
	 VisitGrouping varchar(15));

-- OR CREATE A TABLE THIS WAY
-- Write a SELECT statement to verify the results of the SELECT INTO command
SELECT P.PatientID, P.FirstName, P.LastName,
	   COUNT(OV.VisitID) AS VisitCount,
	   MAX(OV.VisitDate) AS MostRecentVisit,
	   MIN(OV.VisitDate) AS FirstVisit,
	   P.[State],
	   CONVERT(varchar(20), NULL) AS VisitGrouping
INTO OutpatientVisitSummary
FROM Patient AS P
	INNER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
GROUP BY P.PatientID, P.FirstName, P.LastName, P.[State];

SELECT * FROM OutpatientVisitSummary;

