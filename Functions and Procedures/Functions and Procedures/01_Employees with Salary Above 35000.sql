CREATE PROC usp_GetEmployeesSalaryAbove35000
AS
SELECT FirstName AS [First Name], LastName AS [Last Name] FROM Employees
WHERE Salary > 35000

EXEC DBO.usp_GetEmployeesSalaryAbove35000