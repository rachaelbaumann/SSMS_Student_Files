USE HealthCareSample;

SELECT COUNT(*)
FROM (
SELECT COUNT(Condition) AS CountPatients, PatientID
FROM ##PatientConditionData
GROUP BY PatientID
HAVING COUNT(Condition) > 1
) AS Sub;
