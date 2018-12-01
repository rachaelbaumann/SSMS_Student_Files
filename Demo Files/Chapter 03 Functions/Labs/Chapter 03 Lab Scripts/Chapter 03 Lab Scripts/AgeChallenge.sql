USE HealthCareSample;

SELECT P.PatientID, P.DateofBirth
	, CASE
		WHEN DATEPART(dy, GETDATE()) >= DATEPART(dy,P.DateofBirth)
			THEN DATEDIFF(yy, DateofBirth, GETDATE())
		ELSE
			DATEDIFF(yy, DateofBirth, GETDATE()) - 1
	 END AS Age
FROM Patient AS P
;