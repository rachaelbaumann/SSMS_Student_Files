USE HealthCareSample;

-- Get columns from Patient table.
-- Count number of visits from OV as correlated subquery
SELECT P.PatientID, P.FirstName, P.LastName, 
	   (SELECT
	   COUNT(*) FROM OutpatientVisit AS OVInner
	   WHERE OVInner.PatientID = P.PatientID) 
	   AS [Visit Count]
FROM Patient AS P;