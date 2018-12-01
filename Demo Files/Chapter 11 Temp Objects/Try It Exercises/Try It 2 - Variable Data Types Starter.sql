USE RetailBankingSample;

--Step #2
DECLARE @EarliestOpenDate varchar(10) ;
SET @EarliestOpenDate = 
			(SELECT CONVERT(varchar(30), MAX(OpeningDate), 100)
			   FROM Account)
;

SELECT @EarliestOpenDate;

--Step #7
DECLARE @fixedfirstname char(20) = (SELECT RTRIM(MIN(FirstName)) FROM Customer)
	, @lastname varchar(20) = (SELECT MIN(LastName) FROM Customer)
	, @variablefirstname varchar(20) = (SELECT RTRIM(MIN(FirstName)) FROM Customer);

SELECT @fixedfirstname + ' ' + @lastname AS FixedName
	, @variablefirstname + ' ' + @lastname AS VariableFirstName
; 