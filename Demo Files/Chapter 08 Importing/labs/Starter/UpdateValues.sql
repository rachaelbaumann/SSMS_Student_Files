USE RetailBankingSample;

UPDATE Account
SET InterestRate = NULL
WHERE InterestRate = 0
	AND AccountID > 280;

UPDATE Account
SET CreditLimit = NULL
WHERE CreditLimit = 0
	AND AccountID > 280;