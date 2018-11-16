USE RetailBankingSample;

--Step #2
DECLARE @charSample char(10) = 'Test'
	, @varcharSample varchar(10) = 'Test'
	, @ncharSample nchar(10) = N'Test'
	, @nvarcharSample nvarchar(10) = N'Test'

SELECT  @charSample + @varcharSample 
			+ @ncharSample + @nvarcharSample AS AllTogether
;
/*GO - batch directive is included so that I can include a 2nd declaration
of the same variables to make highlighting and executing the queries
easier without having a bunch of red squigglies. */


GO
-- Step #3
DECLARE @charSample char(10) = 'Test'
	, @varcharSample varchar(10) = 'Test'
	, @ncharSample nchar(10) = N'Test'
	, @nvarcharSample nvarchar(10) = N'Test'

SELECT LEN(@charSample) AS CharLen
	, DATALENGTH(@charSample) AS CharBytes
	, LEN(@varcharSample) AS VarCharLen
	, DATALENGTH(@varcharSample) AS VarCharBytes
	, LEN(@NcharSample) AS NCharLen
	, DATALENGTH(@NcharSample) AS NCharBytes
	, LEN(@NvarcharSample) AS NVarCharLen
	, DATALENGTH(@NvarcharSample) AS NVarCharBytes
;

SELECT RTRIM(C.FirstName) + ' ' + C.LastName AS [Full Name]
FROM Customer AS C;
-- OR use CONCAT...
SELECT CONCAT(RTRIM(C.FirstName), ' ', C.LastName) AS [Full Name]
FROM Customer AS C;

SELECT AT.AccountTransactionID, AT.AcctID, AT.TransactionDate, AT.TransactionType,
	-- C2 is currency to 2 decimal places, otherwise use C
	FORMAT(AT.Amount, 'C2', 'en-US') AS [US Amount],
	FORMAT(AT.Amount, 'C2', 'fr-FR') AS [French Amount],
	FORMAT(AT.TransactionDate, 'd', 'en-US') AS [US Date],
	FORMAT(AT.TransactionDate, 'd', 'fr-FR') AS [French Date],
	-- dddd spells out day, MMMM spells out month (mm is minutes)
	-- dd gives days with leading zeroes
	FORMAT(AT.TransactionDate, 'dddd dd MMMM yyyy') AS [Custom Date],
	-- can do this too, but it adds commas
	FORMAT(AT.TransactionDate, 'D') AS [Custom Date]
FROM AccountTransaction AS AT;
