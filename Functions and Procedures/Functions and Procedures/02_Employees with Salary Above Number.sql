CREATE PROC usp_GetEmployeesSalaryAboveNumber
            @LowerBoundSalary DECIMAL(18,4)
         AS
	 SELECT FirstName AS [First Name],
            LastName AS [Last Name]
	   FROM Employees
	  WHERE Salary >= @LowerBoundSalary

 GO
 
 EXEC usp_GetEmployeesSalaryAboveNumber 10000
