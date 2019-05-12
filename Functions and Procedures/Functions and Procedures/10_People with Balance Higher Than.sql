CREATE PROC usp_GetHoldersWithBalanceHigherThan @MinBalance DECIMAL(18,4) 
AS
BEGIN
	SELECT FirstName, LastName FROM AccountHolders AS ah
	JOIN Accounts AS a
	ON a.AccountHolderId = ah.Id
	GROUP BY a.AccountHolderId, FirstName,LastName
	HAVING SUM(a.Balance) > @MinBalance
	ORDER BY FirstName
END

 EXEC  usp_GetHoldersWithBalanceHigherThan 7000

 DROP PROC usp_GetHoldersWithBalanceHigherThan