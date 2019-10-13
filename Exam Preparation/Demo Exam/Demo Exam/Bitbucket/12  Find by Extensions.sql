CREATE PROC usp_FindByExtension (@extension NVARCHAR(30))
AS 
 SELECT Id, [Name], CONCAT(Size, 'KB') AS Size FROM Files
   WHERE RIGHT([Name], LEN(@extension)) = @extension

