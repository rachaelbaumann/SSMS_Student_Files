USE HealthCareSample;

SELECT P.PatientID, P.FirstName, P.LastName, 
	   P.[State] + ', ' + P.Zipcode AS [State and Zip],	    
	   P.Gender
FROM Patient AS P
WHERE Zipcode LIKE '0%'
ORDER BY P.[State] DESC
-- 'State' is a keyword in SQL, so you can wrap it in square brackets
;

-- #7) returns one row for each state, then returns the list alphabetically
SELECT DISTINCT P.[State], P.Zipcode
FROM Patient AS P
ORDER BY P.[State], P.ZipCode;