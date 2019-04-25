USE SoftUni

SELECT DepartmentID, SUM(Salary) AS [TotalSapary] FROM Employees
GROUP BY DepartmentID
ORDER BY DepartmentID