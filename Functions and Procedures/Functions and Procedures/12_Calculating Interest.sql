CREATE PROC usp_CalculateFutureValueForAccount
		    @AccountID INT, 
			@InterestRate DECIMAL(18,4) 
AS 
BEGIN
 SELECT TOP 1
        ah.Id AS [Acount ID], 
        ah.FirstName AS [First Name], 
		ah.LastName AS [Last Name], 
		a.Balance AS [Current Balance], 
		dbo.ufn_CalculateFutureValue(Balance, @InterestRate, 5)
		 AS [Balance in 5 years] FROM AccountHolders AS ah
 JOIN Accounts AS a
 ON a.AccountHolderId = ah.Id
 WHERE ah.Id = @AccountID
END

EXEC dbo.usp_CalculateFutureValueForAccount 1, 0.1