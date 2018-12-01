USE RetailBankingSample;

--Step #3
DECLARE @intYear int = (SELECT YEAR(MAX(OpeningDate)) 
										FROM Account);

--Step #4
SELECT * FROM AccountTransaction
WHERE YEAR(TransactionDate) = @intYear
;