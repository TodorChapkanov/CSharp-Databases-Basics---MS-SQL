SELECT CONCAT(p.FirstName, ' ', p.LastName) AS [Full Name],
              pl.[Name] AS [Plane Name],
	   CONCAT(fl.Origin, ' - ', fl.Destination) AS Trip,
	          lt.Type AS [Luggage Type]
         FROM Passengers AS p
   INNER JOIN Tickets AS t
           ON p.Id = t.PassengerId
   INNER JOIN Flights AS fl
           ON t.FlightId = fl.Id
   INNER JOIN Planes AS pl
           ON fL.PlaneId = pl.Id
   INNER JOIN Luggages AS l
           ON t.LuggageId = l.Id
   INNER JOIN LuggageTypes AS lt
           ON l.LuggageTypeId =lt.Id
		   ORDER BY [Full Name], pl.[Name], Trip, [Luggage Type]