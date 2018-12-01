DECLARE @myvar	datetime2 = '20060830'

SELECT DATEADD(year, -200, @myvar);
SELECT DATEADD(month, 1, '20060831');