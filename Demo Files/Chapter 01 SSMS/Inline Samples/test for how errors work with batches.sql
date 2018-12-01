CREATE TABLE testerror (pk int identity,  col2 char(50));
GO

INSERT INTO testerror (col2)
VALUES (CONCAT(@@IDENTITY, 5));
GO 100


SELECT * FROM testerror;

UPDATE testerror SET col2 = 'a' where pk = 99;

SELECT pk, CONVERT(int, col2) FROM testerror;

--in the result set, notice that rows with pk 1-98 are returned, but 99 and rows after are not

--cleanup
DROP TABLE testerror;