CREATE  TRIGGER t_ExcludedStudents ON Students
FOR DELETE
AS
DECLARE @studentId INT = (SELECT Id FROM deleted );
DECLARE @studentName VARCHAR(50) = (SELECT FirstName FROM deleted );
INSERT INTO ExcludedStudents(StudentId, StudentName)
VALUES(@studentId, @studentName)
