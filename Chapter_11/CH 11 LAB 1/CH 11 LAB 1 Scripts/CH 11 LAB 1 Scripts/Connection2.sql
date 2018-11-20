USE HealthCareSample;

-- Return number of patients whose first visit was in any given year
SELECT COUNT(DISTINCT(PatientID)) AS NewPatientCount
	, DATEPART(yy, FirstVisit)
FROM ##PatientVisitSummary 
GROUP BY DATEPART(yy, FirstVisit);


--WITH VisitYear_CTE (PatientID, VisitDate)
--AS
--(SELECT COUNT(PatientID), MIN(YEAR(VisitDate)) AS YearOfVisit
--FROM ##PatientVisitSummary AS PVS
--WHERE YEAR(VisitDate) IS NULL
--UNION ALL
--SELECT COUNT(PatientID), YearofVisit + 1
--FROM ##PatientVisitSummary AS PVS
--	INNER JOIN VisitYear_CTE
--	ON PVS.
--	)