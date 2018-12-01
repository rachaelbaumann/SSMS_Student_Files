USE HealthCareSample;

--Step #4(1)
SELECT P.PatientID, P.FirstName, P.LastName
	, (SELECT COUNT(*) FROM OutpatientVisit AS OVInner
	    WHERE OVInner.PatientID = P.PatientID)
			AS VisitCount				
FROM Patient AS P
;

--Step #5(9)
SELECT COUNT(*) FROM OutpatientVisit;