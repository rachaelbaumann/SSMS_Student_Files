USE RetailBankingSample;

/*  
Step #4 Excel Birthdate Questions and Answers
a.	What is the most recent birthdate? March 10, 1999
b.	What is the earliest birthdate? January 1, 1753
c.	How many rows have empty birthdates? 15
d.	How many rows have a value of January 1, 1753? 10
e.	How many of the rows with a value of January 1, 1753 are from the new import? all 10
f.	How many NULL birthdate values are for the newly imported rows?  
*/

--SQL to find answer to question 4a.
SELECT MAX(Birthdate)
FROM Customer;
--Results are the same as above.

--SQL to find answer to question 4b.
SELECT MIN(Birthdate)
FROM Customer
;
--Results same as above.

--SQL to find answer to question 4c.
SELECT COUNT(*)
FROM Customer
WHERE Birthdate IS NULL
;
--Results same as above

--SQL to find answer to question 4d.
SELECT COUNT(*)
FROM Customer
WHERE Birthdate = '17530101'
;

-- SQL to find answer to question 4e. Results the same as 4d
SELECT COUNT(*)
FROM Customer
WHERE Birthdate = '17530101'
	AND CustomerID > 300
;

--SQL to find answer to question 4f.  Results differ from 4c - none of the NULL values are from the new rows
SELECT COUNT(*)
FROM Customer
WHERE Birthdate IS NULL
	AND CustomerID > 300
;

--Step #9
UPDATE Customer
SET Birthdate = NULL
WHERE Birthdate = '17530101'
;

--Step #12
SELECT * FROM Customer
WHERE LEN(ZipCode) = 4
;

--Step #13
UPDATE Customer
SET ZipCode = '0' + ZipCode
WHERE LEN(ZipCode) = 4
;