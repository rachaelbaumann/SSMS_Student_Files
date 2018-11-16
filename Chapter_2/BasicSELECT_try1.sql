USE RetailBankingSample;

SELECT LT.LoanTransactionID, TransactionDate, Amount,
	   'Credit transaction of type ' + TransactionType AS [Type Information]
  FROM LoanTransaction AS LT;