CREATE FUNCTION dbo.udf_CalculateTickets(@Origin VARCHAR(50), @Destination VARCHAR(50), @PassengerCount INT)  
RETURNS VARCHAR(MAX)   
AS    
BEGIN 

IF(@PassengerCount <=0)
   BEGIN
     RETURN 'Invalid people count!'
   END
DECLARE @TicketId INT = (SELECT t.Id FROM Flights AS f
                     INNER JOIN Tickets AS t
							 ON t.FlightId = f.Id
						  WHERE f.Origin = @Origin AND f.Destination = @Destination) 
IF (@TicketId IS NULL)
    BEGIN
      RETURN 'Invalid flight!'
    END
DECLARE @TicketPrice DECIMAL(15,2) = (SELECT Price FROM Tickets
											 WHERE ID = @TicketId)
DECLARE @Total DECIMAL(15,2) = @TicketPrice * @PassengerCount
RETURN CONCAT('Total price', ' ', @Total)
END;