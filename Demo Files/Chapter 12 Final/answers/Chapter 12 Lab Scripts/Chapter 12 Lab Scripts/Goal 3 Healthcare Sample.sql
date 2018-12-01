USE HealthCareSample;

SELECT PatientID, [Full Name], COUNT(Condition) AS CountofConditions
FROM ##PatientConditionData
GROUP BY PatientID, [Full Name]
HAVING COUNT(Condition) > 1
;