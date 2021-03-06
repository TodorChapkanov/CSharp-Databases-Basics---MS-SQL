SELECT s.[Name],
   AVG(ss.Grade) AS [Average Grade] 
  FROM Subjects AS s
INNER JOIN StudentsSubjects AS ss
        ON s.Id = ss.SubjectId
  GROUP BY s.Name, s.Id
  ORDER BY s.Id
