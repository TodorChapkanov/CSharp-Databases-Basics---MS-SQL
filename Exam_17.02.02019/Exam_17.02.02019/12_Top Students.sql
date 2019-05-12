SELECT TOP 10
           s.FirstName, 
		   s.LastName, 
		   CONVERT(DECIMAL(15,2),AVG(se.Grade)) AS [Grade]
		   FROM Students AS s
INNER JOIN StudentsExams AS se
ON se.StudentId = s.Id
GROUP BY s.FirstName, s.LastName
ORDER BY AVG(se.Grade) DESC, FirstName, LastName