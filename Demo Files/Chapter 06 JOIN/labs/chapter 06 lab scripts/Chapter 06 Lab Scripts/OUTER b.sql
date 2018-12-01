USE HealthCareSample;

SELECT P.PatientID, P.FirstName, P.LastName
	, P.ZipCode, OV.VisitDate, OV.StaffID1
FROM Patient AS P
	LEFT OUTER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
WHERE OV.VisitID IS NULL
ORDER BY P.PatientID
;