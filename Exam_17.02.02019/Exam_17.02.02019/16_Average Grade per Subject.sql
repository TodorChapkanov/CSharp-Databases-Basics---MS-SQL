SELECT sbj.Name, AVG(ssbj.Grade) FROM Subjects AS sbj
INNER JOIN StudentsSubjects AS ssbj
ON ssbj.SubjectId = sbj.Id
GROUP BY sbj.Name, sbj.Id
ORDER BY sbj.Id