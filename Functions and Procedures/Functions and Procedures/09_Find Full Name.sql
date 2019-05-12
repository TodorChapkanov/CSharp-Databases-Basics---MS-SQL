CREATE PROC usp_GetHoldersFullName 
AS 
BEGIN
	SELECT FirstName + ' ' + LastName AS [Full Name]
	FROM AccountHolders
END

EXEC usp_GetHoldersFullName

DROP PROC usp_GetHoldersFullName