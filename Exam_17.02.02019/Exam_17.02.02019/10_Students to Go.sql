SELECT FirstName
       + ' '
	   + LastName AS [Full Name] FROM Students AS s
LEFT OUTER JOIN StudentsExams AS se
ON se.StudentId = s.Id
WHERE se.ExamId IS NULL
ORDER BY [Full Name]