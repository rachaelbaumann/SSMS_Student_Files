USE HealthCareSample;

--Step #7 option 1
SELECT P.PatientID, P.FirstName, P.LastName
FROM Patient AS P
WHERE EXISTS(SELECT InnerOV.PatientID, COUNT(*) AS VisitCount
FROM OutpatientVisit AS InnerOV
WHERE P.PatientID = InnerOV.PatientID
GROUP BY PatientID
HAVING COUNT(*) >=15
)
;

--Step #7 option 2
SELECT P.PatientID, P.FirstName, P.LastName
FROM Patient AS P
WHERE PatientID IN(SELECT InnerOV.PatientID
FROM OutpatientVisit AS InnerOV
WHERE P.PatientID = InnerOV.PatientID
GROUP BY PatientID
HAVING COUNT(*) >=15
)
;