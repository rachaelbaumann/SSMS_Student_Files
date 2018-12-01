USE RetailBankingSample;

--Step #2
SELECT A.AccountID, A.OpeningDate, A.OpeningBalance
FROM Account AS A
WHERE AccountTypeID BETWEEN 6 AND 9
;


--Step 3
SELECT COUNT(*)
		FROM LoanTransaction AS LT
;


--Step #4
SELECT A.AccountID, A.OpeningDate, A.OpeningBalance
	, (SELECT COUNT(*)
		FROM LoanTransaction AS LT
		WHERE LT.AcctID = A.AccountID
		) AS NumberTransactions
FROM Account AS A
WHERE AccountTypeID BETWEEN 6 AND 9
;

