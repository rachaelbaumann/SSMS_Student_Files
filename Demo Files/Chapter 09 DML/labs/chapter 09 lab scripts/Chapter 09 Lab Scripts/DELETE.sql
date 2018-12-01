USE HealthCareSample;

--Step #9(1)
SELECT DISTINCT OV.PatientID
FROM OutpatientVisit AS OV
INNER JOIN OutpatientVisitSummary  AS OS
	ON OV.PatientID = OS.PatientID
WHERE ICD10_2 IS NULL AND ICD10_3 IS NULL
;

--Step #9(2)
BEGIN TRANSACTION;

--Step #9(3)
DELETE FROM OutpatientVisitSummary
FROM OutpatientVisit AS OV
INNER JOIN OutpatientVisitSummary  AS OS
	ON OV.PatientID = OS.PatientID
WHERE ICD10_2 IS NULL 
;

--Step #9(4)
SELECT  OS.*, OV.ICD10_1, OV.ICD10_2, OV.ICD10_3
FROM OutpatientVisitSummary AS OS
	INNER JOIN OutpatientVisit AS OV
	ON OS.PatientID = OV.PatientID
;


SELECT * FROM OutpatientVisitSummary;

--Step #9(5)
--COMMIT;