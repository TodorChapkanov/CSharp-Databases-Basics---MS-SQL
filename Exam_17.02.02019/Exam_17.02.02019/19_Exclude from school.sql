CREATE PROC usp_ExcludeFromSchool (@studentId INT )
  AS
  IF(NOT EXISTS(SELECT * FROM Students WHERE ID = @studentId))
  BEGIN
		RAISERROR('This school has no student with the provided id!', 16,1)
		RETURN
  END

  

  DELETE FROM StudentsSubjects
  WHERE StudentId = @studentId

  DELETE FROM StudentsTeachers
  WHERE StudentId = @studentId

  DELETE FROM StudentsExams
  WHERE StudentId = @studentId

  DELETE FROM Students
  WHERE ID = @studentId


  EXEC usp_ExcludeFromSchool 126