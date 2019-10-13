SELECT f.Id,
   SUM(t.Price) AS Price 
  FROM Flights AS f
INNER JOIN Tickets AS t
        ON f.Id = t.FlightId
  GROUP BY f.Id
  ORDER BY Price DESC, f.Id