CREATE PROC usp_EmployeesBySalaryLevel @SalaryLevel VARCHAR(10)
AS
BEGIN
	SELECT FirstName AS [First Name],
	       LastName AS [Last Name]
	  FROM Employees AS e
	 WHERE dbo.ufn_GetSalaryLevel(E.Salary) = @SalaryLevel
END

EXEC usp_EmployeesBySalaryLevel 'High'