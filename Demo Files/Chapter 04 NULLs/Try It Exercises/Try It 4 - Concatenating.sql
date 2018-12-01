USE RetailBankingSample;

--Step #3
SELECT CONCAT(C.FirstName, C.MiddleName, C.LastName) 
		AS FullName
FROM Customer AS C
;

--Step #4
SELECT CONCAT(RTRIM(C.FirstName),
					      C.MiddleName, RTRIM(C.LastName)) 
		AS FullName
FROM Customer AS C
;

--Step #5
SELECT CONCAT(RTRIM(C.FirstName), ' '
						 , C.MiddleName, ' ' 
						 , RTRIM(C.LastName)
					    ) AS FullName
FROM Customer AS C
;

--Step #6
SELECT CONCAT(RTRIM(C.FirstName), ' '
						 , C.MiddleName + ' '  
						 -- If middle name is NULL, then
						 --middle name + space is also NULL
						 --and concat replaces the entire NULL 
						 --with an empty string
						 --no extra spaces
						 , RTRIM(C.LastName)
					    ) AS FullName
FROM Customer AS C
;