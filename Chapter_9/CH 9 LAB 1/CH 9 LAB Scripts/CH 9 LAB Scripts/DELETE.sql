USE HealthCareSample;

-- Delete all of the rows from the OutpatientVisitSummary table for patients
-- that have at least 1 visit with ONLY a value in the ICD10_3 columns.
-- 9.1
SELECT DISTINCT OV.PatientID
FROM OutpatientVisit AS OV
	INNER JOIN OutpatientVisitSummary AS OVS
	ON OV.PatientID = OVS.PatientID
WHERE ICD10_2 IS NULL AND ICD10_3 IS NULL;

-- 9.2
BEGIN TRANSACTION
DELETE FROM OutpatientVisitSummary
FROM OutpatientVisit AS OV
	INNER JOIN OutpatientVisitSummary AS OVS
	ON OV.PatientID = OVS.PatientID
WHERE ICD10_2 IS NULL;

