--Step #3
USE RetailBankingSample;

CREATE TABLE TestConversions
	(TestRowID int identity(1,1)
		, Birthdate char(50)
		, JoinAge char(30)
	);

INSERT INTO TestConversions (Birthdate, JoinAge )
	VALUES ('20000115', '15')
				, ('5-5-1945', '45')
				, ('unknown', 'lastyear')
				, ('29/03/45', '17.5')
				, ('mardi 2 f�vrier 1988', '20')
;

SELECT * FROM TestConversions;

--Step #4
SELECT TC.TestRowID, CONVERT(Date, TC.Birthdate)
FROM TestConversions AS TC
;

--Step #5
SELECT TC.TestRowID, CONVERT(int, TC.JoinAge)
FROM TestConversions AS TC
;


--Step #6
SELECT TC.TestRowID, 
	TRY_CONVERT(DATE, TC.Birthdate) AS [Birth Date],
	TRY_CONVERT(int, TC.JoinAge) AS [Join Age]
FROM TestConversions AS TC
;


--Step #7 - If time permits
SELECT TestRowID,
	TRY_PARSE(TC.Birthdate AS DATE USING 'fr-FR') AS [Birth Date]
FROM TestConversions AS TC
WHERE TestRowID IN (4,5);

--Step #8 
--Cleanup


--DROP TABLE TestConversions;
