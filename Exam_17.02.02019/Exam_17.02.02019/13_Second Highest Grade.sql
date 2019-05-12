WITH cte_GRADERANK
AS
(
SELECT s.FirstName,
       s.LastName,
	   ss.Grade ,
ROW_NUMBER() OVER 
       (PARTITION BY s.FIRSTNAME ORDER BY ss.GRADE DESC) AS RowNumber 
  FROM Students  AS s
INNER JOIN StudentsSubjects AS ss
    ON sS.StudentId = s.Id)

SELECT FirstName, 
       LastName, 
	   Grade 
  FROM cte_GRADERANK
 WHERE RowNumber = 2
ORDER BY FirstName, LastName

