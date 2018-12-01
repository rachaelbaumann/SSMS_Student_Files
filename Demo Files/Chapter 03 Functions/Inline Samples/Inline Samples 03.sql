USE RetailBankingSample;

--Numeric data type length and scale caution
DECLARE @largenumeric1 numeric(38,16) = 100000000.1234567812345678 
	, @numeric2 numeric (20,8) = 100.11111111

SELECT @largenumeric1 * @numeric2;

--String Related Data Types
DECLARE @myunicodevar	nchar(50) = N'This is my value'

--Date and Time Data Types
DECLARE @secondsvar datetime2(0) = GETDATE()
	, @nanosecondvar datetime2(7) = GETDATE()

SELECT @secondsvar AS DisplayWholeSeconds
	, @nanosecondvar AS Display100ns
;

--Date Retrieval
SELECT GETDATE() AS CurrentDate1
  , CURRENT_TIMESTAMP as CurrentDate2
  , SYSDATETIME() AS CurrentDateAsDatetime2  
;

--SYSDATETIME data type rounding considerations
DECLARE @mydatetime datetime = '20171231 23:59:59.999'
	, @mydatetime2 datetime2 = '20171231 23:59:59.999'
	, @mydatefromdatetime date
	, @mydatefromdatetime2 date

SET @mydatefromdatetime = @mydatetime
SET @mydatefromdatetime2 = @mydatetime2;

SELECT @mydatefromdatetime AS DatetimeSample
	, @mydatefromdatetime2 AS DateTime2Sample
;

--SYSDATETIMEOFFSET
DECLARE @testsysdatetimeoffset datetimeoffset = SYSDATETIMEOFFSET();

SELECT @testsysdatetimeoffset;

--DATEADD
-- negative number: past
-- positive number: future
SELECT DATEADD(mm, -1, GETDATE())AS OneMonthAgo
	, DATEADD(mi, 30, GETDATE()) AS [30MinutesFromNow]
; 

--DATEDIFF determines the length of time between two dates
-- Days in the future
SELECT AT.AcctID, AT.TransactionDate
	, DATEDIFF(dd, TransactionDate, GETDATE())
		AS NumberofDaysAgo
FROM AccountTransaction AS AT
;
-- days past
SELECT AT.AcctID, AT.TransactionDate
	, DATEDIFF(dd, GETDATE(), TransactionDate)
		AS NumberofDaysAgo
FROM AccountTransaction AS AT
;

--Retrieving Parts of Dates
--DATEPART
SELECT DATEPART(mm, AT.TransactionDate)
FROM AccountTransaction AS AT
;

--DATENAME
SELECT DATENAME(mm, AT.TransactionDate)
FROM AccountTransaction AS AT
;

--DAY, MONTH, YEAR
SELECT MONTH('20180204') AS MonthNumber;

--From Parts Functions
SELECT DATETIMEOFFSETFROMPARTS 
		( 
				2010, 12     , 31, 14     , 23     , 30
			--Year , Month, Day, Hour, Minute, Second	
				, 0         , 12            , 0             , 7  
			--fractions, offset hr, offset minute, precision
		 )	AS Result;

--TODATETIMEOFFSET
DECLARE @SampleDate datetime2(0) = '20180101 10:15:30' 
SELECT @SampleDate AS Original
			, TODATETIMEOFFSET (@SampleDate, '+05:00')
				AS OffsetDateTime
;

--SWITCHOFFSET
DECLARE @datevar datetimeoffset = '20180101 10:15:30 +5:00' 

SELECT @datevar AS Original
	, SWITCHOFFSET(@datevar, '+08:00') AS NewTime
;

--EOMONTH
SELECT EOMONTH('20120215') AS LeapYearEndofFebruary
	, EOMONTH('20150215') AS NonLeapYearEndofFebruary
;

--ISDATE
SELECT ISDATE('20180228') AS valid
	, ISDATE('20180231') AS NoFeb31
	, ISDATE('30/12/2018') AS NotSupportedAsWritten
	, ISDATE('12/31/2018') AS SupportedOrder
;


--SET DATEFORMAT 
SET DATEFORMAT DMY;

--More Info - Find list of language based defaults
EXEC sp_helplanguage;

USE PhishingSample;

--Nesting Functions - final query
SELECT U.UserID
	, U.EmailAddress
	, Substring(U.EmailAddress
						, (CHARINDEX('@', U.EmailAddress) + 1)
						, (LEN(U.EmailAddress) - CHARINDEX('.', REVERSE(U.EmailAddress)) 
							- (CHARINDEX('@', U.EmailAddress)) 
						   )								
					 ) AS ExtractedCompany
FROM [User] AS U
;

--Nesting Functions - sample of building one step at a time
--1
SELECT U.UserID
	, U.EmailAddress
FROM [User] AS U
;
--2
SELECT U.UserID
	, U.EmailAddress
	, REVERSE(U.EmailAddress)
FROM [User] AS U
;
--3
SELECT U.UserID
	, U.EmailAddress
	, CHARINDEX('.', REVERSE(U.EmailAddress)) AS Reversedperiodlocation
FROM [User] AS U
;
--4 locate at what character count the last period is located
SELECT U.UserID
	, U.EmailAddress
	, LEN(U.EmailAddress) - CHARINDEX('.', REVERSE(U.EmailAddress)) AS LastPeriodLocation
FROM [User] AS U
;
--5 - Add charindex in to find the @ as the start location
--temporarily put a fixed value of 255 in the lenth to return to test the starting point
--notice that the charindex returns the @ since we are starting there
SELECT U.UserID
	, U.EmailAddress
	, Substring(U.EmailAddress
						, CHARINDEX('@', U.EmailAddress)
						, 255
					 ) AS ExtractedCompany
FROM [User] AS U
;
--6 - add 1 to the starting locatin to only pull what is after the @
SELECT U.UserID
	, U.EmailAddress
	, Substring(U.EmailAddress
						, (CHARINDEX('@', U.EmailAddress) + 1)
						, 255
					 ) AS ExtractedCompany
FROM [User] AS U
;
--7 View numeric values of the at(@), period(.), and the difference of the two 
SELECT U.UserID
	, U.EmailAddress
	, LEN(U.EmailAddress) - CHARINDEX('.', REVERSE(U.EmailAddress)) AS PeriodLocation
	, (CHARINDEX('@', U.EmailAddress) + 1) AS AtLocationPlus1
	, (LEN(U.EmailAddress) - CHARINDEX('.', REVERSE(U.EmailAddress)) 
			- (CHARINDEX('@', U.EmailAddress))
		) AS LengthToReturn
FROM [User] AS U
;
--8 put it all together
SELECT U.UserID
	, U.EmailAddress
	, Substring(U.EmailAddress
						, (CHARINDEX('@', U.EmailAddress) + 1)
						, (LEN(U.EmailAddress) - CHARINDEX('.', REVERSE(U.EmailAddress)) 
							- (CHARINDEX('@', U.EmailAddress)) 
						   )								
					 ) AS ExtractedCompany
FROM [User] AS U
;

USE RetailBankingSample;
--CONVERT
SELECT CONVERT (varchar(20), A.OpeningDate, 112) AS [Style 112]
FROM Account AS A;

--PARSE
--will fail
SELECT PARSE('2 978,15 €' AS money);

--should succeed
SELECT PARSE('2 978,15 €' AS money USING 'fr-FR');

--STR Function
DECLARE @numeratorvar float = 2
	, @denominatorvar float = 3
	, @floatvar float;

SET @floatvar = @numeratorvar / @denominatorvar;
SELECT @floatvar, STR(@floatvar, 20, 3);