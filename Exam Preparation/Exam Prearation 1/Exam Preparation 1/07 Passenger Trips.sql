SELECT CONCAT(p.FirstName, ' ', p.LastName) AS [Full Name],
         f.Origin,
		 f.Destination
    FROM Passengers AS p
INNER JOIN Tickets AS t
        ON p.Id = t.PassengerId
INNER JOIN Flights AS f
        ON t.FlightId = f.Id
  ORDER BY [Full Name], f.Origin, f.Destination