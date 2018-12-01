USE HealthCareSample;

SELECT TOP 1 Condition, COUNT(*) TotalCases
FROM ##PatientConditionData
GROUP BY CONDITION
ORDER BY TotalCases DESC
;