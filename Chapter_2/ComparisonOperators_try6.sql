USE RetailBankingSample;

SELECT A.AccountID, A.OpeningDate, A.OpeningBalance
FROM Account AS A
WHERE A.OpeningDate >= '20120101';

SELECT A.AccountID, A.OpeningDate, A.OpeningBalance
FROM Account AS A
WHERE A.OpeningBalance > 10000;

SELECT A.AccountID, A.OpeningDate, A.OpeningBalance
FROM Account AS A
WHERE A.OpeningBalance > 10000
  AND A.OpeningDate >= '20120101';