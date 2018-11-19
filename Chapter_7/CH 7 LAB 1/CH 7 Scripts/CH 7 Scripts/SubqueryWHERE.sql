USE HealthCareSample;

-- Return columns from Patient table where number of visits is >= 15 from 
-- OV table
SELECT P.PatientID, P.FirstName, P.LastName
FROM Patient AS P
WHERE (SELECT
	   COUNT(*) FROM OutpatientVisit AS OVInner
	   WHERE OVInner.PatientID = P.PatientID
	   ) >= 15;