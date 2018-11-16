USE HealthCareSample;

SELECT OV.VisitID, 
	RIGHT('0' + CONVERT(varchar(2), DATEPART(MM, OV.VisitDate)), 2) 
	AS [Char Month],
	CONVERT(varchar(25), OV.VisitDate, 102)
FROM OutpatientVisit AS OV;