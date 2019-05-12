CREATE PROC usp_GetTownsStartingWith 
            @BeginWith VARCHAR(10)
         AS
     SELECT t.Name FROM Towns AS t
      WHERE t.Name LIKE (@BeginWith + '%')

EXEC usp_GetTownsStartingWith 'SA'

DROP PROC usp_GetTownsStartingWith