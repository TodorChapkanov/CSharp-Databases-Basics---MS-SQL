SELECT FirstName 
       + ' ' 
	   + COALESCE(s.MIDDLENAME + ' ', '') 
	   + LastName AS [Full Name] 
  FROM Students AS s
LEFT OUTER JOIN StudentsSubjects AS ss
    ON ss.StudentId = s.Id
 WHERE ss.SubjectId IS NULL
 ORDER BY [Full Name]