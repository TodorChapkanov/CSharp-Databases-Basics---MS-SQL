CREATE TRIGGER tr_LogEmails ON Logs
AFTER INSERT
AS 
BEGIN
     DECLARE @RecipientId INT;
     DECLARE @OldBalance DECIMAL(15,2); 
	 DECLARE @NewBalance DECIMAL(15,2);
	 DECLARE @Subject VARCHAR(200);
	 DECLARE @Body VARCHAR(200);

	 SET @RecipientId = (SELECT AccountId FROM inserted);
	 SET @OldBalance = (SELECT OldSum FROM inserted);
	 SET @NewBalance = (SELECT NewSum FROM inserted);
	 SET @Body = CONCAT('On ', GETDATE(), ' your balance was changed from ', @OldBalance,' to ', @NewBalance,'.')
	 SET @Subject = CONCAT('Balance change for account: ', @RecipientId);

    INSERT INTO NotificationEmails
	VALUES (@RecipientId, @Subject, @Body)
END