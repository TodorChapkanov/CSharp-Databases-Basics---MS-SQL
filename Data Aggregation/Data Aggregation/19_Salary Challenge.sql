SELECT TOP 10 FirstName, LastName, DepartmentID FROM Employees AS e1
WHERE Salary > (SELECT AVG(Salary) FROM Employees AS e2
WHERE e2.DepartmentID = e1.DepartmentID
GROUP BY DepartmentID)