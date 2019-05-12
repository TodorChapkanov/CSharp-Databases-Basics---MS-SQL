SELECT t.FirstName + ' ' + t.LastName AS [Teacher Full Name],
       sbj.Name ,s.FirstName + ' ' + s.LastName AS [Student Full Name],
    AVG(ss.Grade),
	DENSE_RANK() OVER (PARTITION BY s.Id ORDER BY AVG(ss.Grade) DESC) AS gradeRANK
  FROM Students AS s
INNER JOIN StudentsSubjects AS ss
    ON ss.StudentId = s.Id
INNER JOIN Subjects AS sbj
    ON sbj.Id = ss.SubjectId
INNER JOIN Teachers AS t 
   ON t.SubjectId = sbj.Id
  GROUP BY s.FirstName, s.LastName , ss.Id, sbj.Id, t.FirstName, t.LastName, SBJ.Name, s.ID
ORDER BY sbj.Name