USE RetailBankingSample;

SELECT E.EmployeeID,
	   RTRIM(E.FirstName) + ' ' + E.LastName AS [Employee Name],
	   E.Title, E.ReportsTo,
	   --M.EmployeeID,
	   RTRIM(M.FirstName) + ' ' + M.LastName AS [Manager Name],
	   M.Title
FROM Employee AS E
	INNER JOIN Employee AS M
	ON E.ReportsTo = M.EmployeeID;

-- Include all managers
SELECT E.EmployeeID,
	   RTRIM(E.FirstName) + ' ' + E.LastName AS [Employee Name],
	   E.Title, E.ReportsTo,
	   --M.EmployeeID,
	   RTRIM(M.FirstName) + ' ' + M.LastName AS [Manager Name],
	   M.Title
FROM Employee AS E
	LEFT OUTER JOIN Employee AS M
	ON E.ReportsTo = M.EmployeeID;