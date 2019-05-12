SELECT e.EmployeeID, 
       e.FirstName, 
	   e2.EmployeeID AS ManagerID, 
	   e2.FirstName AS ManagerName 
  FROM Employees AS e
  JOIN Employees AS e2
    ON e2.EmployeeID = E.ManagerID
 WHERE e2.EmployeeID IN (3, 7)
ORDER BY e.EmployeeID
 