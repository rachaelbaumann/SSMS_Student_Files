USE RetailBankingSample;

-- Get most recent birthdate
SELECT MAX(C.BirthDate)
FROM Customer AS C;

-- Get earliest birthdate 
SELECT MIN(C.BirthDate)
FROM Customer AS C;

-- How many rows have BirthDate as NULL?
SELECT COUNT(*)
FROM Customer
WHERE BirthDate IS NULL;

-- Count rows where BirthDate is 1753-01-01
SELECT COUNT(*)
FROM Customer
WHERE BirthDate = '17530101';

-- How many rows from the new data (ID > 300) have a BirthDate of 1753-01-01?
SELECT COUNT(*)
FROM Customer
WHERE BirthDate = '17530101' AND CustomerID > 300;

-- How many rows have a NULL value for BirthDate in the new data (ID > 300)?
SELECT COUNT(*)
FROM Customer
WHERE BirthDate IS NULL AND CustomerID > 300;

-- Set NULL BirthDates to 1753-01-01
UPDATE Customer
SET Birthdate = NULL
WHERE Birthdate = '17530101';

-- Return every row in Customer table where the length of the ZipCode is 4 characters long
SELECT * FROM Customer
WHERE LEN(ZipCode) = 4;

-- Update ZipCode values to have a leading zero
UPDATE Customer
SET ZipCode = '0' + ZipCode
WHERE LEN(ZipCode) = 4;