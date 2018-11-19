USE RetailBankingSample;

-- BEFORE
SELECT * FROM Customer
WHERE StateProvinceCode = '*M';

-- DURING
BEGIN TRANSACTION
	UPDATE Customer
	SET FirstName = 'Katya'
	WHERE StateProvinceCode = '*M';

	SELECT * FROM Customer
	WHERE StateProvinceCode = '*M';

-- AFTER
ROLLBACK TRANSACTION
	SELECT * FROM Customer
	WHERE StateProvinceCode = '*M';