USE SampleAnalytics;

-- check table data
SELECT * FROM Patient;

-- Check max, min, avg, sum
SELECT MIN(DateofBirth) AS [Min DOB],
	   MAX(DateofBirth) AS [Max DOB]
FROM Patient;

-- alter PA table to change mortality_score data type
--ALTER TABLE PatientAnalytics
--	ALTER COLUMN mortality_score numeric(18, 16);

SELECT * FROM PatientAnalytics2;

SELECT MIN(mortality_score) AS [Min MS],
	   MAX(mortality_score) AS [Max MS]
FROM PatientAnalytics2;