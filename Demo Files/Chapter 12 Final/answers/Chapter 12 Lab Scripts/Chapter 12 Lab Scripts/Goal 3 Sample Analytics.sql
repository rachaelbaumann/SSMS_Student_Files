USE SampleAnalytics;

--Use the EXCEPT to see if there are any rows that are different
SELECT * 
FROM HealthCareSample.dbo.Patient
EXCEPT
SELECT * 
FROM Patient 
ORDER BY PatientID
;

--Reivew a couple of the PatientIDs that were returned from the first query
--Notice that the import replaced the missing values with an empty string instead of NULL
--in the Gender and Race columns.
--In SQL, they are not the same.  For this example, this discrepency is not important, so you do not need to make any changes.
SELECT * 
FROM HealthCareSample.dbo.Patient
UNION 
SELECT * 
FROM Patient 
ORDER BY PatientID
;



--Review the entire table sorted by different columns
SELECT * FROM PatientAnalytics
ORDER BY DateOfBirth
--ORDER BY 

;

--Review some values to test against data in Excel for the PatientAnalyticFile_withScore.csv file.
SELECT SUM(CONVERT(int,PA.Myocardial_infarction)) AS Myo
	, SUM(CONVERT(int,PA.Congestive_heart_failure)) AS CHF
	, SUM(CONVERT(int,PA.Peripheral_vascular_disease)) PVD
	,SUM(CONVERT(int, PA.Stroke)) AS Stroke
	,MIN(PA.DateOfBirth) AS DOBMin
	,MAX(PA.DateOfBirth) AS DOBMax
	, MIN(PA.First_Appointment_Date) FADMin
	, MAX(PA.First_Appointment_Date) FADMax
	, MIN(PA.Last_Appointment_Date) LADMin
	, MAX(PA.Last_Appointment_Date) LADMax
	, MIN(PA.DateOfDeath) AS DeathDateMin
	, SUM(PA.mortality_score) AS SumofScore
	,AVG(PA.mortality_score) AS AvgofScore
FROM PatientAnalytics AS PA
;

