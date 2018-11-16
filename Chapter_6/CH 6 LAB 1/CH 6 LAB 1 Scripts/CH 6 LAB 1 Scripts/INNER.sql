USE HealthCareSample;

SELECT P.PatientID, P.FirstName, P.LastName, P.ZipCode,
	   OV.VisitDate, OV.StaffID1
FROM Patient AS P
	 INNER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID;