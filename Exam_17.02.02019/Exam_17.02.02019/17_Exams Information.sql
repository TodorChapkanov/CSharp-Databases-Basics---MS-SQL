SELECT CASE
    WHEN MONTH(e.Date) <=3 THEN 'Q1'
    WHEN MONTH(e.Date) <= 6 THEN 'Q2'
    WHEN MONTH(e.Date) <= 9 THEN 'Q3'
    WHEN MONTH(e.Date) <= 12 THEN 'Q4'
	ELSE 'TBA'
	END AS [Quarter], sbJ.Name,( COUNT(se.StudentId))
	FROM Exams AS e
	INNER JOIN Subjects AS sbJ
	ON sbj.Id = e.SubjectId
	INNER JOIN StudentsExams AS se
	ON se.ExamId = e.Id
	WHERE sE.Grade >=4
   GROUP BY sbJ.Name, e.Date
	ORDER BY [Quarter],sbj.Name