--Step #2 - Set database context and create sample table
USE RetailBankingSample;

GO

CREATE TABLE TestNulls
	(col1 int identity
	, col2 varchar(5)
	, col3 varchar(5)
	);

--Step #3 - Populate the TestNulls table
INSERT INTO TestNulls VALUES (NULL, 'a'), ('', 'b'), (' ', 'c'), ('a', 'd');

--Step #4 - Review the data entered into the TestNulls table
SELECT * FROM TestNulls;

--Step #5 - Review concatenated results
SELECT col1, col2, col3, col2 + col3 AS NewColumn
FROM TestNulls;

--Step #6 - Review how NULL values are ignore in a COUNT aggregate function
SELECT COUNT(col2) FROM TestNulls

--Step #7 - Clean up
DROP TABLE TestNulls;