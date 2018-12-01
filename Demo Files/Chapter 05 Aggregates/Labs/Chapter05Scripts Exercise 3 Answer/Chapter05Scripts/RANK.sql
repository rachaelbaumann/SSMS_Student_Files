USE HealthCareSample;

--Step #4(1)
SELECT OV.VisitID, OV.PatientID, OV.VisitDate, OV.ClinicCode
FROM OutpatientVisit AS OV
;

--Step #4(2)
SELECT OV.VisitID, OV.PatientID, OV.VisitDate, OV.ClinicCode
	, DENSE_RANK() OVER (ORDER BY OV.VisitDate) AS DateRank
	, NTILE(500) OVER (ORDER BY OV.VisitDate) AS DateGroup
FROM OutpatientVisit AS OV
;
