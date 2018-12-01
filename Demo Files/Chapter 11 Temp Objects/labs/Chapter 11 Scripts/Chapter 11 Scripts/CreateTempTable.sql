USE HealthCareSample;

--Step #5 (2)
SELECT P.PatientID, P.FirstName, P.LastName
	, P.DateofBirth, COUNT(OV.VisitID) AS VisitCount
	, MIN(OV.VisitDate) AS FirstVisit
	, MAX(OV.VisitDate) AS MostRecentVisit
FROM Patient AS P
	INNER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
GROUP BY P.PatientID, P.FirstName, P.LastName, P.DateofBirth
;


--Step #6 (1)
SELECT P.PatientID, P.FirstName, P.LastName
	, P.DateofBirth, COUNT(OV.VisitID) AS VisitCount
	, MIN(OV.VisitDate) AS FirstVisit
	, MAX(OV.VisitDate) AS MostRecentVisit
INTO ##PatientVisitSummary
FROM Patient AS P
	INNER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
GROUP BY P.PatientID, P.FirstName, P.LastName, P.DateofBirth
;

