CREATE FUNCTION ufn_GetSalaryLevel(@Salary DECIMAL(18,4))
RETURNS VARCHAR(10)
             AS
          BEGIN
        DECLARE @SalaryLevel VARCHAR(10);
            SET @SalaryLevel =
           CASE	
           WHEN @Salary < 30000 THEN 'Low'
           WHEN @Salary <= 50000 THEN 'Average'
           ELSE 'High'
		    END
		 RETURN @SalaryLevel;
            END
GO

SELECT Salary, DBO.ufn_GetSalaryLevel(Salary) AS [Salary Level] FROM Employees
