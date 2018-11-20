USE HealthCareSample;

-- Return columns for patients who were born 30 or fewer years ago and who
-- have had 15 or more visits
SELECT PatientID, FirstName, LastName, DateofBirth, VisitCount
FROM ##PatientVisitSummary
WHERE (YEAR(GETDATE()) - YEAR(DateofBirth)) < 30
	   AND
	   VisitCount >= 15;