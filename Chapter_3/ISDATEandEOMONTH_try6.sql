--Step #2
SELECT ISDATE('20180228') AS valid
	, ISDATE('20180231') AS NoFeb31
	, ISDATE('30/12/2018') AS NotSupportedAsWritten
	, ISDATE('12/31/2018') AS SupportedOrder
;

--Step #3
--SET DATEFORMAT DMY;
SET DATEFORMAT MDY;


--Step #7
USE RetailBankingSample; 

SELECT CT.CreditTrxID, 
	CONVERT(DATE, CT.TransactionDate), 
	CT.Amount, 
	EOMONTH(CT.TransactionDate) AS EndofMonth
FROM CreditTransaction AS CT
;