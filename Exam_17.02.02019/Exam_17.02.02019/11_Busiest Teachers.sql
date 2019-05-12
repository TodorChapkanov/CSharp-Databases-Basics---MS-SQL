SELECT TOP 10
           FirstName, 
		   LastName, 
		   COUNT(st.StudentId) 
	  FROM Teachers AS t
INNER JOIN StudentsTeachers AS st
        ON st.TeacherId = t.Id
  GROUP BY t.FirstName, t.LastName
  ORDER BY COUNT(st.StudentId) DESC, FirstName, LastName