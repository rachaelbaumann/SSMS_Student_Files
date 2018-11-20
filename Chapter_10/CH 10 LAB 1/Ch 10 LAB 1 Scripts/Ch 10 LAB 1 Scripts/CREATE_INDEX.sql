USE HealthCareSample;

-- Add an index to the table to improve performance when only one conddition
-- is searched at a time.
CREATE INDEX 
	nc_PatientDiseaseMap_Condition
	ON PatientDiseaseMap (Condition)
	INCLUDE (FullName, PatientID);
	--WHERE Condition = 'Depression';