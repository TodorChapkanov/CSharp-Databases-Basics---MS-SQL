SELECT TOP 5 
           e.EmployeeID, 
		   e.FirstName, 
		   p.Name 
	  FROM Employees AS e
      JOIN EmployeesProjects AS ep
        ON ep.EmployeeID = e.EmployeeID
      JOIN Projects AS p
        ON p.ProjectID = ep.ProjectID
     WHERE p.StartDate > '20020813' 
	   AND p.EndDate IS NULL
ORDER BY e.EmployeeID
