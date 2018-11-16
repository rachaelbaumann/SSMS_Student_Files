USE HealthCareSample;

-- Return all patients, including those NOT listed in the OV tbale
SELECT P.PatientID, P.FirstName, P.LastName, P.ZipCode,
	   OV.VisitDate, OV.StaffID1
FROM Patient AS P
	 LEFT OUTER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
ORDER BY OV.PatientID;