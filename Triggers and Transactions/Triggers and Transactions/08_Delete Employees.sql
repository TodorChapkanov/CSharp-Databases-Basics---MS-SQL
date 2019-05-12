CREATE TABLE Deleted_Employees(
  EmployeeId INT PRIMARY KEY, 
  FirstName VARCHAR(50) NOT NULL, 
  LastName VARCHAR(50) NOT NULL, 
  MiddleName VARCHAR(50) NOT NULL, 
  JobTitle VARCHAR (50) NOT NULL, 
  DepartmentId INT , 
  Salary DECIMAL(15,2)
 ) 

GO

CREATE TRIGGER tr_DeletedEmployees 
            ON Employees
FOR DELETE
 AS
BEGIN
   INSERT INTO Deleted_Employees
       SELECT  FirstName, 
	           LastName,
			   MiddleName, 
			   JobTitle, 
			   DepartmentID, 
			   Salary 
	      FROM deleted 
 END