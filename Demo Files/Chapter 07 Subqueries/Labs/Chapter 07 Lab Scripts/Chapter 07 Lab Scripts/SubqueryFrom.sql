USE HealthCareSample;

--Step #9
SELECT InnerOV.PatientID, InnerOV.VisitID
	, InnerOV.VisitDate, InnerOV.StaffID1
	, YEAR(InnerOV.VisitDate) AS VisitYear
FROM OutpatientVisit AS InnerOV
WHERE VisitDate IS NOT NULL
;

--Step #10
SELECT Yearly.PatientID
	, VisitYear
	, COUNT(*) AS AnnualVisits
FROM 
	(SELECT InnerOV.PatientID, InnerOV.VisitID
		, InnerOV.VisitDate, InnerOV.StaffID1
		, YEAR(InnerOV.VisitDate) AS VisitYear
	FROM OutpatientVisit AS InnerOV
	WHERE VisitDate IS NOT NULL) AS Yearly
GROUP BY Yearly.PatientID, Yearly.VisitYear
;


