USE HealthCareSample;

SELECT OV.VisitDate,
	DATEPART(yyyy, OV.VisitDate) AS [Year],
	DATENAME(mm, OV.VisitDate) AS [Month],
	DATEPART(mm, OV.VisitDate) AS [Month Number],
	DATENAME(dw, OV.VisitDate) AS [Day of Week],
	DATEPART(dd, OV.VisitDate) AS [Day of Month],
	DATEPART(dy, OV.VisitDate) AS [Day of Year],
	DATEADD(DD, 30, OV.VisitDate)
FROM OutpatientVisit AS OV;

--CHALLENGE
--SELECT P.PatientID, P.DateofBirth
--FROM Patient AS P;