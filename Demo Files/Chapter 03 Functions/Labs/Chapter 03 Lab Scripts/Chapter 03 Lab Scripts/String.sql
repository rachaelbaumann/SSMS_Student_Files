USE PhishingSample;

--Step 7(1)
SELECT U.EmailAddress
	, U.EmailAddress 
FROM [User] AS U
;

--Step 7(2)
SELECT U.EmailAddress
	, CHARINDEX('.', U.EmailAddress)
FROM [User] AS U
;

--Step 7(3)
SELECT U.EmailAddress
	, SUBSTRING(U.EmailAddress, CHARINDEX('.', U.EmailAddress), 500)
FROM [User] AS U
;

--Step 7(4)
SELECT U.EmailAddress
	, SUBSTRING(U.EmailAddress
						, CHARINDEX('.', U.EmailAddress) + 1
						, 500)
FROM [User] AS U
;


--Step 7(5)
SELECT U.EmailAddress
	, SUBSTRING(U.EmailAddress
						, CHARINDEX('.', U.EmailAddress) + 1
						, CHARINDEX('@', U.EmailAddress) 
								- CHARINDEX('.', U.EmailAddress) - 1
						)
FROM [User] AS U
;

--Step 7(6)
SELECT U.EmailAddress
	, SUBSTRING(U.EmailAddress
						, CHARINDEX('.', U.EmailAddress) + 1
						, CHARINDEX('@', U.EmailAddress) 
								- CHARINDEX('.', U.EmailAddress) - 1
						) AS LastName
FROM [User] AS U
;