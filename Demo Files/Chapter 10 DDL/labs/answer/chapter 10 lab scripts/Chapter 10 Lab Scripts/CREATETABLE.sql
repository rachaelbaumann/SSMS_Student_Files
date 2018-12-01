--Step 4(1)
USE HealthCareSample;

--Step 5(1)
CREATE TABLE PatientDiseaseMap
	(PDM_Key int IDENTITY (1,1) PRIMARY KEY NOT NULL
	, PatientID int  
	, FullName varchar(20) NOT NULL
	, Condition varchar(250) NOT NULL
	)	
;				