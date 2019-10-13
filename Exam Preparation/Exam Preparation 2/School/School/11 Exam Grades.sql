CREATE FUNCTION udf_ExamGradesToUpdate(@studentId INT , @grade DECIMAL(15,2))
RETURNS VARCHAR(150)
AS 
BEGIN
	IF (@grade > 6.00)
	  BEGIN
	   RETURN 'Grade cannot be above 6.00!'
	  END
	IF((SELECT Id FROM Students WHERE Id = @studentId) IS NULL)
	  BEGIN
	   RETURN 'The student with provided id does not exist in the school!'
	  END
DECLARE @studentFirstName NVARCHAR(30) = (SELECT FirstName FROM Students WHERE Id = @studentId)
DECLARE @gradeCount INT = (SELECT COUNT(*) FROM StudentsExams 
                                  WHERE StudentId = @studentId AND 
								  Grade >= @grade AND Grade <= @grade + 0.5)
RETURN CONCAT('You have to update ',  @gradeCount , ' grades for the student ', @studentFirstName) 
END
