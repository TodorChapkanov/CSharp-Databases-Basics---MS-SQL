CREATE FUNCTION ufn_IsWordComprised(@SetOfLetters VARCHAR(50), @Word VARCHAR(50))
RETURNS BIT
BEGIN
DECLARE @Count INT = 1;
	WHILE @Count <= LEN(@Word)
	BEGIN
		IF(CHARINDEX(SUBSTRING(@Word,@Count,1), @SetOfLetters,1) = 0)
			BEGIN
				RETURN 0
			END
		SET	@Count = @Count+ 1;
	END
	RETURN 1
END

GO

SELECT FirstName FROM Employees
WHERE dbo.ufn_IsWordComprised('oistmiahf', FirstName) = 1

DROP FUNCTION dbo.ufn_IsWordComprised