USE HealthCareSample;

-- Write a SELECT statement with a WHERE clause to return patients with 
-- depression.
SELECT * FROM PatientDiseaseMap
WHERE Condition = 'Depression';