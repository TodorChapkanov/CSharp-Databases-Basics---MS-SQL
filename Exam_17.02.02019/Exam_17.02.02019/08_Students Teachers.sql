SELECT s.FirstName, 
       s.LastName, 
	   COUNT(TeacherId) AS TeachersCount 
  FROM STUDENTS AS s
INNER JOIN StudentsTeachers AS st
    ON st.StudentId = s.Id
GROUP BY FirstName, LastName
ORDER BY LastName