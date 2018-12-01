--Set database to HealthCareSample
USE HealthCareSample;

--Step #2
SELECT P.PatientID, P.FirstName, P.LastName, P.[State], P.ZipCode, P.Gender
FROM Patient AS P;
/* Note - because State is a key word in SQL, it turns blue.  
** The query still runs successfully, but best practice would
** be to encase it in square brackets as shown in the answer. 
*/

--Step #3
SELECT P.PatientID, P.FirstName, P.LastName
	, P.[State] + ' ' + P.ZipCode AS [State and Zipcode]
	, P.Gender
FROM Patient AS P;

--Step #4
SELECT P.PatientID, P.FirstName, P.LastName
	, P.[State] + ' ' + P.ZipCode AS [State and Zipcode]
	, P.Gender
FROM Patient AS P
ORDER BY [State and Zipcode] DESC;

--Step #5
SELECT P.PatientID, P.FirstName, P.LastName
	, P.[State] + ' ' + P.ZipCode AS [State and Zipcode]
	, P.Gender
FROM Patient AS P
WHERE P.Gender = 'male'
ORDER BY [State and Zipcode] DESC;

--Step #6
SELECT P.PatientID, P.FirstName, P.LastName
  , P.[State] + ' ' + P.ZipCode AS [State and Zipcode]
  , P.Gender
FROM Patient AS P
WHERE P.Gender = 'male'
    AND P.ZipCode LIKE '0%'
ORDER BY [State and Zipcode] DESC;

--Step #7
SELECT DISTINCT P.[State]
FROM Patient AS P
ORDER BY P.[State];

--Step #8
SELECT DISTINCT P.[State], P.ZipCode
FROM Patient AS P
ORDER BY P.[State], P.ZipCode;