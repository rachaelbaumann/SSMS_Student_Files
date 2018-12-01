--Step #2
SELECT CONVERT(varchar(30), GETDATE(), 109);

--Step #8
--Query from help page
SELECT name, SUBSTRING(name, 1, 1) AS Initial 
	, SUBSTRING(name, 3, 2) AS ThirdAndFourthCharacters
FROM sys.databases  
WHERE database_id < 5;

--Step #10
USE RetailBankingSample;

--Step #11
SELECT FirstName, SUBSTRING(FirstName, 1, 1) AS Initial 
	, SUBSTRING(FirstName, 3, 2) AS ThirdAndFourthCharacters
FROM Customer;