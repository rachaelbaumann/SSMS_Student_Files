/*
Missing Index Details from Try It 8 - Execution Plans.sql - (local).RetailBankingSample (ANN-P50\Ann (64))
The Query Processor estimates that implementing the following index could improve the query cost by 96.2027%.
*/

/*
USE [RetailBankingSample]
GO
CREATE NONCLUSTERED INDEX [nc_CreditTransaction_AcctID]
ON [dbo].[CreditTransaction] ([AcctID])
INCLUDE ([CreditTrxID],[Amount],[TransactionDate])
GO
*/
