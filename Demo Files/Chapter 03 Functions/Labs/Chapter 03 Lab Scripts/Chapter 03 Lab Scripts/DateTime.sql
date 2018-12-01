USE HealthCareSample;

--Step #9(1)
SELECT OV.PatientID, OV.VisitDate
FROM OutpatientVisit AS OV
;

--Step #9(2)
SELECT OV.PatientID, OV.VisitDate
	, DATEPART(yy, OV.VisitDate) AS [Year]
	, DATENAME(mm, OV.VisitDate) AS [MonthName]
	, DATEPART(mm, OV.VisitDate) AS  MonthNumber
	, DATENAME(dw, OV.VisitDate) AS [DayofWeek]
	, DATEPART(dd,OV.VisitDate) AS [DayofMonth]
	, DATEPART(dy, OV.VisitDate) AS [DayofYear]
	, DATEADD(dd,30,OV.VisitDate) AS Net30
FROM OutpatientVisit AS OV
;