USE RetailBankingSample;

--Step #1
SELECT E.EmployeeID
	, E.FirstName + ' ' + E.LastName AS EmployeeName
	, E.Title, E.ReportsTo
FROM Employee AS E
;

--Step #3
SELECT E.EmployeeID
	, E.FirstName + ' ' + E.LastName AS EmployeeName
	, E.Title, E.ReportsTo
	, M.EmployeeID
	, M.FirstName + ' ' + M.LastName AS ManagerName
	, M.Title
FROM Employee AS E 
	INNER JOIN Employee AS M
	ON E.ReportsTo = M.EmployeeID
;

--Step #6
SELECT E.EmployeeID
	, E.FirstName + ' ' + E.LastName AS EmployeeName
	, E.Title, E.ReportsTo
--	, M.EmployeeID
	, M.FirstName + ' ' + M.LastName AS ManagerName
	, M.Title
FROM Employee AS E 
	LEFT OUTER JOIN Employee AS M
	ON E.ReportsTo = M.EmployeeID
;