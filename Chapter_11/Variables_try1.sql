USE RetailBankingSample;

-- Declare a variable named @intYear with a data type of int and set the value to the maximum
-- OpeningDate in the Account table
DECLARE @intYear int = (SELECT YEAR(MAX(OpeningDate))  FROM Account);

-- Write a SELECT statement to return all the columns from the AccountTransaction table where 
-- the TransactionDate is the same year as the intYear variable
SELECT * FROM AccountTransaction
WHERE YEAR(TransactionDate) = @intYear;

-- MUST EXECUTE ALL THIS TO WORK!