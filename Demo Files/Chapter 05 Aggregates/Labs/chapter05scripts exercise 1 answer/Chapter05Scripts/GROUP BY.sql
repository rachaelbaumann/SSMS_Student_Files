USE HealthCareSample;

--Step #5(4)
SELECT OV.PatientID, COUNT(*)AS NumberPatientVisits
	, COUNT(OV.ICD10_2) AS NumberVisitsWithICD10_2Codes
FROM OutpatientVisit AS OV
GROUP BY OV.PatientID
;

--Step #6(1)
SELECT OV.PatientID, COUNT(*)AS NumberPatientVisits
	, COUNT(OV.ICD10_2) AS NumberVisitsWithICD10_2Codes
FROM OutpatientVisit AS OV
GROUP BY OV.PatientID
HAVING COUNT(OV.ICD10_2) > 0
;

--Step #7(1)
SELECT OV.PatientID, COUNT(*)AS NumberPatientVisits
	, COUNT(OV.ICD10_2) AS NumberVisitsWithICD10_2Codes
FROM OutpatientVisit AS OV
WHERE OV.VisitDate >= '20160101'
GROUP BY OV.PatientID
HAVING COUNT(OV.ICD10_2) > 0
;
