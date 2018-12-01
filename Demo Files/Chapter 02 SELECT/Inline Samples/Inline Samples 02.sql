USE RetailBankingSample;

--SELECT and FROM Clauses
SELECT * FROM dbo.Customer;

SELECT FirstName, LastName, CustomerID FROM dbo.Customer;

--Fully Qualified - replace SQL1 with your server name
SELECT * FROM SQL1.RetailBankingSample.dbo.Customer;

--Partially Qualified - all three of these syntaxes produce the same results
SELECT * FROM RetailBankingSample..Customer ;

SELECT * FROM dbo.Customer ;

SELECT * FROM Customer ;

--Table and Column Aliases
SELECT C.FirstName AS [First Name], C.LastName AS [Last Name]
FROM Customer AS C
;

--String Literals
SELECT 'Credit Transaction' AS [Transaction Source]
	, TransactionDate
	, Amount
FROM CreditTransaction
;

--Sample Escape Sequence
SELECT 'This isn''t all that hard';

--Concatenation
SELECT FirstName + ' ' + LastName AS [Full Name]
FROM Customer
;

--Modulus - Returns the remainder of the first number divided by the second
SELECT 10 % 5 AS Remainder;

SELECT 12 % 5 AS Remainder;

--Simple CASE
SELECT LT.LoanTransactionID, Amount
	, CASE TransactionType
		WHEN 'Interest' THEN 'Int'
		WHEN 'MonthlyPayment' THEN 'Pmt'
	END AS TypeAbbr
FROM LoanTransaction AS LT
;

--Searched CASE
SELECT E.EmployeeID
	, CASE 
			WHEN E.HireDate > '20160101' THEN 'Recent Hire'
			ELSE 'Veteran Employee'
		END AS EmploymentLength
FROM Employee AS E
;

--ELSE (sample showing results when rows don't match without ELSE)
SELECT CT.CreditTrxID, Amount
	, CASE TransactionType
		WHEN 'Interest' THEN 'Int'
		WHEN 'Payment' THEN 'Pmt'
	END AS TypeAbbr
FROM CreditTransaction AS CT
;


--ELSE (sample showing results when rows don't match with ELSE)
SELECT CT.CreditTrxID, Amount
	, CASE TransactionType
		WHEN 'Interest' THEN 'Int'
		WHEN 'Payment' THEN 'Pmt'
	ELSE 'na'
	END AS TypeAbbr
FROM CreditTransaction AS CT
;

--ORDER BY
SELECT C.CustomerID, C.FirstName, C.LastName
FROM Customer AS C
ORDER BY C.LastName DESC, C.FirstName
;

--Comparison Operators Numeric Sample
SELECT AT.AccountTransactionID, AT.Amount
FROM AccountTransaction AS AT
WHERE AT.Amount >= 5000
;

--Comparison Operators Date Sample
SELECT AT.AccountTransactionID, AT.TransactionDate
FROM AccountTransaction AS AT
WHERE TransactionDate = '20180101'
;

--Comparison Operators Character Sample
SELECT C.LastName
FROM Customer AS C
WHERE C.LastName < 'D'
;

--AND/OR/NOT
SELECT C.FirstName, C.LastName
FROM Customer AS C
WHERE  LastName = 'Johnson'  
	AND FirstName = 'Roy'
;


SELECT C.FirstName, C.LastName
FROM Customer AS C
WHERE  LastName = 'Johnson'  
	OR FirstName = 'Roy'
;

SELECT C.FirstName, C.LastName
FROM Customer AS C
WHERE NOT LastName = 'Johnson'  
	AND (FirstName = 'Steve'
			OR FirstName =  'Roy')
;

--BETWEEN
SELECT AT.AccountTransactionID, AT.TransactionDate
FROM AccountTransaction AS AT
WHERE AT.TransactionDate 
	BETWEEN '20120101' AND '20141231 23:59:59'
;

--Greater than and less than instead of between
SELECT AT.AccountTransactionID, AT.TransactionDate
FROM AccountTransaction AS AT
WHERE AT.TransactionDate >= '20120101' 
	AND AT.TransactionDate < '20150101'
;

--IN
SELECT TransactionType, Amount
FROM AccountTransaction
WHERE TransactionType IN ('ATM', 'Direct Deposit')
;

--LIKE for pattern matching
--% - any 0 to infinite character
SELECT AccountNumber
FROM CustomerAccount
WHERE AccountNumber LIKE '%75'
;
-- where account number ends in 75

--  _ exactly one character
SELECT AccountNumber
FROM CustomerAccount
WHERE AccountNumber LIKE '_R%'
;
-- where second character is R

--[ ] list
SELECT AccountNumber
FROM CustomerAccount
WHERE AccountNumber LIKE '[RT]%'
;
-- starts with an R or a T

SELECT AccountNumber
FROM CustomerAccount
WHERE AccountNumber LIKE '[R,T]%'
;
-- starts with an R or a T

--[ ] Range
SELECT AccountNumber
FROM CustomerAccount
WHERE AccountNumber LIKE '[R-T]%'
;
-- starts with R, S, or T

--^ NOT
SELECT C.StateProvinceCode
FROM Customer AS C
WHERE C.StateProvinceCode LIKE '%[^A-Z]%'
;
-- can start with anything but not end in an A or Z

--Escape 
--We don't have any data in the databases with these reserved characters
--The sample below will return an empty result set with one underscore
--and the word "Match" with two underscores.
--Variables will be covered in Chapter 11
DECLARE @test varchar(50) = '30%'
SELECT 'Match' 
WHERE @test LIKE '__[%]';

GO

DECLARE @test varchar(50) = '30%'
SELECT 'Match' 
WHERE @test LIKE '__|%' ESCAPE '|';



--DISTINCT applies to the entire row, use when you don't want duplicate rows
SELECT DISTINCT C.City, C.StateProvinceCode
FROM Customer AS C
;

--TOP
SELECT TOP 30 AcctID, Amount
FROM AccountTransaction AS AT
ORDER BY AT.Amount DESC
;

--TOP Percents
SELECT TOP 10 PERCENT AcctID, Amount
FROM AccountTransaction AS AT
ORDER BY AT.Amount DESC
;

--Top WITH TIES
SELECT TOP 30 WITH TIES AcctID
	, Amount, AT.TransactionDate 
FROM AccountTransaction AS AT
ORDER BY AT.TransactionDate DESC
;