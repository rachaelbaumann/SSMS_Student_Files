USE SampleAnalytics;

SELECT  PA.PatientID, P.FirstName + ' ' + P.LastName AS [Full Name]
	, PA.Gender, PA.Race, PA.DateOfBirth
-- include next line for testing only - not requested as part of result set.
--	, PA.DateOfDeath, PA.mortality_score
FROM PatientAnalytics AS PA
	JOIN Patient AS P
	ON P.PatientID = PA.PatientID
WHERE death = 'Yes' AND mortality_score < .3 ;