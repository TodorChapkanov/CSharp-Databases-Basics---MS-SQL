CREATE FUNCTION dbo.udf_UserTotalCommits(@username NVARCHAR(50))
RETURNS INT
AS 
 BEGIN
  DECLARE @userId INT = (SELECT Id FROM Users WHERE Username = @username)
  IF (@userId IS NULL)
    BEGIN 
     RETURN 0
    END
 DECLARE @count INT = (SELECT COUNT(*) FROM Commits
                        WHERE ContributorId = @userId)
  RETURN @count
END

