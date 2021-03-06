CREATE TRIGGER tr_AccountsLogs
            ON Accounts
         AFTER UPDATE
            AS 
         BEGIN
   INSERT INTO Logs(AccountId, OldSum, NewSum)
	    SELECT d.Id, d.Balance, i.Balance FROM  inserted AS i
	INNER JOIN deleted AS d
	        ON d.Id = i.Id
END