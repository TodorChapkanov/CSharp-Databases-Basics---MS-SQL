BACKUP DATABASE SoftUni
TO DISK = 'C:\usb flash\SoftUni.bak'

GO

CREATE PROC usp_DeleteEmployeesFromDepartment (@DepartmentId INT)
AS

DECLARE @EmployeeIDsToBeDeleted TABLE
(
Id int
)

INSERT INTO @EmployeeIDsToBeDeleted
SELECT e.EmployeeID
FROM Employees AS e
WHERE e.DepartmentID = @DepartmentId

ALTER TABLE Departments
ALTER COLUMN ManagerID int NULL

DELETE FROM EmployeesProjects
WHERE EmployeeID IN (SELECT Id FROM @EmployeeIDsToBeDeleted)

UPDATE Employees
SET ManagerID = NULL
WHERE ManagerID IN (SELECT Id FROM @EmployeeIDsToBeDeleted)

UPDATE Departments
SET ManagerID = NULL
WHERE ManagerID IN (SELECT Id FROM @EmployeeIDsToBeDeleted)

DELETE FROM Employees
WHERE EmployeeID IN (SELECT Id FROM @EmployeeIDsToBeDeleted)

DELETE FROM Departments
WHERE DepartmentID = @DepartmentId 

SELECT COUNT(*) AS [Employees Count] FROM Employees AS e
JOIN Departments AS d
ON d.DepartmentID = e.DepartmentID
WHERE e.DepartmentID = @DepartmentId

DROP DATABASE SoftUni

RESTORE DATABASE SoftUni
FROM DISK = 'C:\usb flash\SoftUni.bak'