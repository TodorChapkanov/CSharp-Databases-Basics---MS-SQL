CREATE PROC usp_WithdrawMoney (@AccountId INT , @MoneyAmount DECIMAL(18,4))
AS
   BEGIN TRANSACTION
           IF(@MoneyAmount <=0)
		     BEGIN
                ROLLBACK
			    RETURN
		     END

		 UPDATE Accounts
		 SET Balance -= @MoneyAmount
		 WHERE Id = @AccountId

		     IF(@@ROWCOUNT <> 1)
		       BEGIN
			     ROLLBACK
			     RETURN
			   END
   COMMIT