/*
Missing Index Details from SQLQuery7.sql - (local).RetailBankingSample (ANN-P50\Ann (64))
The Query Processor estimates that implementing the following index could improve the query cost by 75.5222%.
*/

/*
USE [RetailBankingSample]
GO
CREATE NONCLUSTERED INDEX [nc_CreditTransaction_TransactionDate]
ON [dbo].[CreditTransaction] ([TransactionDate])
INCLUDE ([CreditTrxID],[AcctID],[Amount])
GO
*/
