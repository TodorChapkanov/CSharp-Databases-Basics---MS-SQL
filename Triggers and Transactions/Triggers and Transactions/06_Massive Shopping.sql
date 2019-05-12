DECLARE @userGameId INT;
SET @userGameId = (SELECT Id FROM UsersGames AS ug
                     WHERE ug.GameId = (SELECT Id FROM Games WHERE Name = 'Safflower') 
					 AND ug.UserId = (SELECT Id FROM Users WHERE FirstName = 'Stamat'))

DECLARE @userTotalAmount DECIMAL (18,4);
SET @userTotalAmount= (SELECT Cash FROM UsersGames
							WHERE Id = @userGameId)
DECLARE @userId INT;
SET @userId = (SELECT Id FROM Users WHERE FirstName = 'Stamat')

DECLARE @lowItemLevel INT;
DECLARE @upItemLevel INT;
SET @lowItemLevel = 11;
SET @upItemLevel = 12;
DECLARE @itemsTotalCost DECIMAL(18,4);
SET @itemsTotalCost = (SELECT SUM(i.Price) FROM Items AS i
                              WHERE MinLevel BETWEEN @lowItemLevel AND @upItemLevel)

IF(@userTotalAmount >= @itemsTotalCost)
BEGIN
     BEGIN TRANSACTION
	 UPDATE UsersGames
	 SET Cash -=@itemsTotalCost
     WHERE Id = @userGameId
	   IF(@@ROWCOUNT <> 1)
	       ROLLBACK
	   ELSE
	   BEGIN
	   INSERT INTO UserGameItems(ItemId,UserGameId)
	   (SELECT Id, @userGameId FROM Items AS i
	   WHERE i.MinLevel BETWEEN @lowItemLevel AND @upItemLevel)
	   END
	   COMMIT
END


SET @lowItemLevel = 19;
SET @upItemLevel = 21;
SET @userTotalAmount = (SELECT Cash FROM UsersGames
							WHERE Id = @userGameId);
SET @itemsTotalCost = (SELECT SUM(i.Price) FROM Items AS i
                              WHERE MinLevel BETWEEN @lowItemLevel AND @upItemLevel)

IF(@userTotalAmount >= @itemsTotalCost)
BEGIN
     BEGIN TRANSACTION
	 UPDATE UsersGames
	 SET Cash -=@itemsTotalCost
	   IF(@@ROWCOUNT <> 1)
	       ROLLBACK
	   ELSE
	   BEGIN
	   INSERT INTO UserGameItems(ItemId,UserGameId)
	   (SELECT Id, @userGameId FROM Items AS i
	   WHERE i.MinLevel BETWEEN @lowItemLevel AND @upItemLevel)
	   END

	   COMMIT
END

SELECT i.Name FROM Items AS i
JOIN UserGameItems AS ugi
ON ugi.ItemId = i.Id
WHERE ugi.UserGameId = 110
ORDER BY i.Name 



