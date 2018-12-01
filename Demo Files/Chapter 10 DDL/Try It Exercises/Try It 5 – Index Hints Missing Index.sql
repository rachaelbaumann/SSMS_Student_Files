/*
Missing Index Details from SQLQuery6.sql - (local).RetailBankingSample (ANN-P50\Ann (57))
The Query Processor estimates that implementing the following index could improve the query cost by 61.3157%.
*/

/*
USE [RetailBankingSample]
GO
CREATE NONCLUSTERED INDEX [nc_AccountTran_TranDate]
ON [dbo].[AccountTransaction] ([TransactionDate])
INCLUDE ([AcctID],[Amount])
GO
*/
