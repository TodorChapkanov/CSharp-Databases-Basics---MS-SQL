CREATE PROC usp_DepositMoney @AccountId INT, @MoneyAmount DECIMAL(18,4)
AS 
     BEGIN TRAN
        
          UPDATE Accounts
          SET Balance += @MoneyAmount
          WHERE Accounts.Id = @AccountId
           IF(@@ROWCOUNT <> 1)
             BEGIN
                ROLLBACK
                RETURN	
              END
     COMMIT