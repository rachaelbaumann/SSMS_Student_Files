USE HealthcareSample;

--Step #5(1)
SELECT OV.VisitID, OV.VisitDate
	, RIGHT('0' + CONVERT(varchar(2), DATEPART(mm, OV.VisitDate)), 2) 
		AS CharMonth
FROM OutpatientVisit AS OV
;

--Step #6(1)
SELECT OV.VisitID, OV.VisitDate
	, RIGHT('0' + CONVERT(varchar(2), DATEPART(mm, OV.VisitDate)), 2) 
		AS CharMonth
	, CONVERT(varchar(20), OV.VisitDate, 102) AS VisitDate
FROM OutpatientVisit AS OV
;
