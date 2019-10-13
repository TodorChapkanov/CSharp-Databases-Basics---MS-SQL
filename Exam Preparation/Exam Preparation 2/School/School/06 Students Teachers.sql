SELECT s.FirstName,
       s.LastName, 
 COUNT(ss.StudentId) AS TeachersCount 
  FROM Students AS s
INNER JOIN StudentsTeachers AS ss
        ON s.Id = ss.StudentId
  GROUP BY s.FirstName, s.LastName