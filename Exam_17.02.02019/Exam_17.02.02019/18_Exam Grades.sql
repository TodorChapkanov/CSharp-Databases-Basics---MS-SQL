CREATE FUNCTION udf_ExamGradesToUpdate (@studentId INT , @grade DECIMAL(3,2))
  RETURNS VARCHAR(250)
  AS
  BEGIN
  IF(@grade > 6.00)
	BEGIN
		RETURN 'Grade cannot be above 6.00!'
	END
  IF(NOT EXISTS(SELECT * FROM STUDENTS WHERE ID = @studentId))
	BEGIN 
		RETURN 'The student with provided id does not exist in the school!'
	END

   DECLARE @range DECIMAL(3,2);
   SET @range = 0.50;
   DECLARE @upRangeGrade DECIMAL(3,2);
   SET @upRangeGrade = @grade + @range;
   DECLARE @studentFirstName VARCHAR(50);
   SET @studentFirstName = (SELECT FirstName FROM Students WHERE Id = @studentId);
   DECLARE @result INT;
   SET @result = (SELECT COUNT(*) FROM StudentsExams
   WHERE StudentId = @studentId AND  Grade BETWEEN @grade AND @upRangeGrade);

   RETURN 'You have to update ' + CAST(@result AS VARCHAR)  + ' grades for the student '+ CAST(@studentFirstName AS VARCHAR)
   END
