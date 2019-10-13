SELECT CONCAT(s.FirstName, ' ', s.LastName) AS [Full Name]
         FROM Students AS s
LEFT OUTER JOIN StudentsExams AS ss
             ON s.Id = ss.StudentId
          WHERE ss.ExamId IS NULL
       ORDER BY [Full Name]