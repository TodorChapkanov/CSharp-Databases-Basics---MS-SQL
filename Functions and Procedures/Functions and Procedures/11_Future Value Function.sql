CREATE OR ALTER FUNCTION ufn_CalculateFutureValue (@I DECIMAL(15, 2), @R FLOAT , @T INT)
RETURNS DECIMAL(18,3)
AS
BEGIN
	DECLARE @TotalSum DECIMAL(18,3);
	SET @TotalSum = @I*POWER(1 + @R, @T)

	RETURN @TotalSum
END

GO
SELECT dbo.ufn_CalculateFutureValue(1000, 0.1, 5)

DROP FUNCTION DBO.ufn_CalculateFutureValue