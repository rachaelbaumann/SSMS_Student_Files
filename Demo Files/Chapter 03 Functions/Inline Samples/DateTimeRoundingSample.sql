--datetime data type rounding
DECLARE @testdatetimelower datetime = '20181231 23:59:59.998'
	, @testdatetimehigher datetime = '20181231 23:59:59.999';

SELECT @testdatetimelower AS RoundedDown
	, @testdatetimehigher AS RoundedUpToNextDayMonthAndYear
;

--smalldatetime data type rounding
--accurate to the whole minute
DECLARE @testsmalldatetimelower smalldatetime = '20181231 23:59:29.998'
	, @testsmalldatetimehigher smalldatetime = '20181231 23:59:29.999';

SELECT @testsmalldatetimelower AS RoundedDown
	, @testsmalldatetimehigher AS RoundedUpToNextDayMonthAndYear
;