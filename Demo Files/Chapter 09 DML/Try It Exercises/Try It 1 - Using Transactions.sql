USE RetailBankingSample;

SELECT * FROM Customer 
    WHERE StateProvinceCode = '*M';

BEGIN TRANSACTION
  UPDATE Customer
    SET FirstName = 'Testing 1 2 3' 
    WHERE StateProvinceCode = '*M';
  SELECT * FROM Customer 
    WHERE StateProvinceCode = '*M';
ROLLBACK TRANSACTION
  SELECT * FROM Customer 
    WHERE StateProvinceCode = '*M';

