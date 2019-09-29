CREATE TABLE Students(
StudentID INT PRIMARY KEY,
Name NVARCHAR(50)
)
 
 GO

CREATE TABLE Exams(
ExamID INT PRIMARY KEY,
Name NVARCHAR(255)
)
 
 GO

CREATE TABLE StudentsExams(
StudentID INT,
ExamID INT,
CONSTRAINT PK_StudentID_ExamID PRIMARY KEY(StudentID, ExamID),
CONSTRAINT FK_StudentsExams_Students FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
CONSTRAINT FK_StudentsExams_ExamID FOREIGN KEY(ExamID) REFERENCES Exams(ExamID)
)

GO
 
INSERT INTO Students(StudentID, [Name])
VALUES
    (1, 'Mila'),
    (2, 'Toni'),
    (3, 'Ron')
 
 GO

INSERT INTO Exams(ExamID, [Name])
VALUES
    (101, 'SpringMVC'),
    (102, 'Neo4j'),
    (103, 'Oracle 11g')
 
 GO

INSERT INTO StudentsExams(StudentID, ExamID) 
VALUES
  (1, 101),
  (1, 102),
  (2, 101),
  (3, 103),
  (2, 102),
  (2, 103)