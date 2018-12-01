USE RetailBankingSample;

--Step #5
SELECT  COUNT(*) % 5 AS Remainder
FROM Customer
;

--Step #7
SELECT AccountID, AccountTypeID, PrimaryCustomerID
	, InterestRate AS CurrentInterestRate 
	, InterestRate + .003 AS ProposedInterestRate
FROM Account AS A
WHERE AccountTypeID IN (2,5)
;

