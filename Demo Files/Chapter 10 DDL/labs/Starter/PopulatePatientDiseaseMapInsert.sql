USE HealthCareSample;

--Step #6(3)
INSERT INTO PatientDiseaseMap 
SELECT DISTINCT P.PatientID
	, P.FirstName + ' ' + P.LastName AS FullName
	, Condition
FROM Patient AS P
	INNER JOIN OutpatientVisit AS OV
	ON P.PatientID = OV.PatientID
	INNER JOIN DiseaseMap AS DM
	ON OV.ICD10_1 = DM.ICD10
;
SELECT * FROM PatientDiseaseMap;