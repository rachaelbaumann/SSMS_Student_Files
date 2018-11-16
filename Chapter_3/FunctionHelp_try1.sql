USE RetailBankingSample;

SELECT FirstName, SUBSTRING(FirstName, 1, 1) AS Initial ,
SUBSTRING(FirstName, 3, 2) AS ThirdAndFourthCharacters
FROM Customer;
--WHERE database_id < 5;  