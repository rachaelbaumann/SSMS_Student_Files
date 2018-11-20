USE HealthCareSample;

-- Alter the PDM definition to increase the full name column to allow up to 110
-- characters
ALTER TABLE PatientDiseaseMap
	ALTER COLUMN FullName varchar(110);

SELECT * FROM PatientDiseaseMap;