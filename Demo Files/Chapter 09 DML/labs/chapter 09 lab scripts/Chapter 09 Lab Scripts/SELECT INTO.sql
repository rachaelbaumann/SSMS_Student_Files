USE HealthCareSample;

--Step #6(2)
SELECT P.PatientID, P.FirstName, P.LastName
	, COUNT(OV.VisitID) AS VisitCount
	, MAX(OV.VisitDate) AS MostRecentVisit
	, MIN(OV.VisitDate) AS FirstVisit
	, P.[State], CONVERT(varchar(20), NULL) AS VisitGrouping
FROM Patient AS P
	INNER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
GROUP BY P.PatientID, P.FirstName, P.LastName, P.[State]
;

--Step #6(3)
SELECT P.PatientID, P.FirstName, P.LastName
	, COUNT(OV.VisitID) AS VisitCount
	, MAX(OV.VisitDate) AS MostRecentVisit
	, MIN(OV.VisitDate) AS FirstVisit
	, P.[State], CONVERT(varchar(20), NULL) AS VisitGrouping
INTO OutpatientVisitSummary
FROM Patient AS P
	INNER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
GROUP BY P.PatientID, P.FirstName, P.LastName, P.[State]
;

--Step #7(1)
SELECT * FROM OutpatientVisitSummary;


