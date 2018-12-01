USE HealthCareSample;

--Goal 1 Step (2)
SELECT DISTINCT P.PatientID, P.FirstName + ' ' + P.LastName AS [Full Name]
	,P.DateofBirth, DM.Condition
FROM Patient AS P
	INNER JOIN OutpatientVisit AS OV
		ON P.PatientID = OV.PatientID
	INNER JOIN DiseaseMap AS DM
		ON (OV.ICD10_1 = DM.ICD10)
			OR (OV.ICD10_1 = DM.ICD10)
			OR (OV.ICD10_1 = DM.ICD10)
;

--Goal 1 Step (3)
SELECT DISTINCT P.PatientID, P.FirstName + ' ' + P.LastName AS [Full Name]
	,P.DateofBirth, DM.Condition
INTO ##PatientConditionData
FROM Patient AS P
	INNER JOIN OutpatientVisit AS OV
		ON P.PatientID = OV.PatientID
	INNER JOIN DiseaseMap AS DM
		ON (OV.ICD10_1 = DM.ICD10)
			OR (OV.ICD10_1 = DM.ICD10)
			OR (OV.ICD10_1 = DM.ICD10)
;

--Verify new temp table has the data your want.
SELECT * FROM ##PatientConditionData;