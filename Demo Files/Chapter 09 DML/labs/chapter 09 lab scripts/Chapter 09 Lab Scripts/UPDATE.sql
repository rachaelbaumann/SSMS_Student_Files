USE HealthCareSample;

--Step #12(1)
SELECT PatientID, VisitCount
	, CASE 
	WHEN VisitCount <=10 THEN 'Low'
	WHEN VisitCount <= 50 THEN 'Moderate'
	WHEN VisitCount <= 100 THEN 'High'
	ELSE 'Very High'
	END AS VisitGroup
FROM OutpatientVisitSummary
ORDER BY  VisitGroup
;

--Step #13(1)
BEGIN TRANSACTION

--Step #13(2)
UPDATE OutpatientVisitSummary
SET VisitGrouping =  CASE 
	WHEN VisitCount <=10 THEN 'Low'
	WHEN VisitCount <= 50 THEN 'Moderate'
	WHEN VisitCount <= 100 THEN 'High'
	ELSE 'Very High'
	END
;

--Step #13(3)
SELECT * FROM OutpatientVisitSummary
ORDER BY VisitCount
;

--Step #13(4)
--COMMIT