/*
Missing Index Details from INDEXHints_try5.sql - (local).RetailBankingSample (RACHAEL\racha (52))
The Query Processor estimates that implementing the following index could improve the query cost by 61.3157%.
*/


USE [RetailBankingSample]
GO
CREATE NONCLUSTERED INDEX [nc_AccountTran_TranDate]
ON [dbo].[AccountTransaction] ([TransactionDate])
INCLUDE ([AcctID],[Amount])
GO

