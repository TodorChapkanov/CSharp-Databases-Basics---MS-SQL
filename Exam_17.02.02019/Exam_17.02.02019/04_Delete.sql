
DELETE FROM StudentsTeachers
WHERE TeacherId IN (SELECT Id FROM Teachers WHERE Phone LIKE '%72%')

GO

DELETE FROM Teachers
WHERE Phone LIKE '%72%'