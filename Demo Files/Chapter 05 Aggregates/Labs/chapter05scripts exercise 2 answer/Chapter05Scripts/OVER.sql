USE HealthCareSample;

--Step #4(1)
SELECT OV.PatientID, OV.VisitDate, OV.ClinicCode
FROM OutpatientVisit AS OV
;

--Step #4(2)
SELECT OV.PatientID, OV.VisitDate
	, DATEPART(yy, OV.VisitDate) AS VisitYear
	, OV.ClinicCode
FROM OutpatientVisit AS OV
;

--Step #4(4)
SELECT OV.PatientID, OV.VisitDate
	, DATEPART(yy, OV.VisitDate) AS VisitYear
	, OV.ClinicCode
	, COUNT(*) OVER (PARTITION BY PatientID) AS VisitCount
	, COUNT(*) OVER 
			(PARTITION BY PatientID, DATEPART(yy,OV.VisitDate)) 
			AS VisitCount2016andLater
FROM OutpatientVisit AS OV
;