USE RetailBankingSample;

SELECT CT.CreditTrxID, CT.AcctID
, ABS(CT.Amount) AS PositiveAmount
FROM CreditTransaction AS CT
WHERE TransactionType = 'charge'
;