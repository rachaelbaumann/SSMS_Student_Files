USE HealthCareSample;

--Step #12(1)
CREATE INDEX nc_PDM_Condition
ON PatientDiseaseMap (Condition)
INCLUDE (FullName, PatientID)
;

