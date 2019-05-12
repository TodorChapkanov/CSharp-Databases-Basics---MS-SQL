SELECT TOP 5
           E.EmployeeID, 
		   e.JobTitle, 
		   A.AddressID, 
		   A.AddressText 
	  FROM Employees AS e
JOIN Addresses AS a ON a.AddressID = e.AddressID
ORDER BY A.AddressID