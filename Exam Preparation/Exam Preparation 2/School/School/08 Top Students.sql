SELECT TOP (10)
            s.FirstName,
			s.LastName,
 FORMAT(AVG(ss.Grade), 'N2') AS Grade 
       FROM Students AS s
 INNER JOIN StudentsExams AS ss
         ON s.Id = ss.StudentId
   GROUP BY s.FirstName , s.LastName
   ORDER BY Grade DESC, s.FirstName, s.LastName