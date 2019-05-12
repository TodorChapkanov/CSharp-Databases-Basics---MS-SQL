CREATE PROC usp_AssignProject(@employeeId INT, @projectID INT)
AS
DECLARE @maxCountOfProjectsPerEmployee INT
SET @maxCountOfProjectsPerEmployee = 3;
   BEGIN TRANSACTION
     DECLARE @employeeTotalProjects INT;
       INSERT INTO EmployeesProjects(EmployeeID, ProjectID)
       VALUES (@employeeId, @projectID)
   SET @employeeTotalProjects = (SELECT COUNT(*) FROM EmployeesProjects
							     WHERE EmployeeID = @employeeId)
     IF(@employeeTotalProjects> @maxCountOfProjectsPerEmployee)
       BEGIN
	     RAISERROR('The employee has too many projects!',16,1)
		 ROLLBACK
		 RETURN
       END
	COMMIT
