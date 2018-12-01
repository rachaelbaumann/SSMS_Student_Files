USE HealthCareSample;

SELECT DISTINCT P.PatientID, P.LastName + ', ' + P.FirstName AS FullName
	, CASE
		WHEN DATEPART(dy, GETDATE()) >= DATEPART(dy,P.DateofBirth)
			THEN DATEDIFF(yy, DateofBirth, GETDATE())
		ELSE
			DATEDIFF(yy, DateofBirth, GETDATE()) - 1
	 END AS Age
	 , ISNULL(CONVERT(varchar(30), MAX(OV.VisitDate) OVER (PARTITION BY P.PatientID), 111), ' ') AS DateofLastVisit
	 , CONVERT(varchar(30), GETDATE(), 111) AS ReportDate
	 , ISNULL(DM.Condition, ' ') AS VisitCondition
FROM Patient AS P
	LEFT JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
	LEFT JOIN Mortality AS M
	ON M.PatientID = P.PatientID
	LEFT JOIN DiseaseMap AS DM
	ON OV.ICD10_1 = DM.ICD10
WHERE M.PatientID IS NULL
;