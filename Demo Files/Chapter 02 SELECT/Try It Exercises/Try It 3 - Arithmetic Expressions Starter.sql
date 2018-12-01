USE RetailBankingSample;

--Step #5
SELECT  COUNT(*) AS CustomerCount
FROM Customer
;

--Step #7
SELECT AccountID, AccountTypeID, PrimaryCustomerID
	, InterestRate AS CurrentInterestRate 
FROM Account AS A
WHERE AccountTypeID IN (2,5)
;

