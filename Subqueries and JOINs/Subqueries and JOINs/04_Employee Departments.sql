SELECT TOP 5
       ep.EmployeeID, 
       ep.FirstName, 
	   ep.Salary, 
	   d.Name AS [DepartmentName] 
  FROM Employees AS ep
INNER JOIN Departments AS d
    ON D.DepartmentID = ep.DepartmentID
 WHERE ep.Salary > 15000
ORDER BY ep.DepartmentID
