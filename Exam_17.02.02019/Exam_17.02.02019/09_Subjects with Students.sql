SELECT t.FirstName
       + ' '
	   + t.LastName AS [Full Name],
	   s.[Name] 
	   + '-'
	   + CAST(s.Lessons AS VARCHAR) AS [Subjects],
	   COUNT (st.StudentId) AS [Students]
	   FROM Teachers AS t
INNER JOIN Subjects AS s
    ON s.Id = t.SubjectId
INNER JOIN StudentsTeachers AS st
    ON st.TeacherId = t.Id
GROUP BY FirstName,LastName, Lessons, s.Name
ORDER BY Students DESC, [Full Name] ASC, [Subjects] ASC