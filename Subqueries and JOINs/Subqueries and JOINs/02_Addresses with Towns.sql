SELECT TOP 50
           e.FirstName, 
		   e.LastName, 
		   t.Name, 
		   A.AddressText 
	  FROM Employees AS e
JOIN Addresses AS a ON A.AddressID = E.AddressID
JOIN Towns AS t ON t.TownID = A.TownID
ORDER BY E.FirstName , LastName