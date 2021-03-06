CREATE TABLE Students(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(30) NOT NULL,
MiddleName NVARCHAR(25) ,
LastName NVARCHAR(30) NOT NULL,
Age INT NOT NULL ,
[Address] NVARCHAR(50),
Phone CHAR(10),
CONSTRAINT ch_StudentAge
CHECK (Age >= 0)
)

CREATE TABLE Subjects(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(20) NOT NULL,
Lessons INT NOT NULL,
CONSTRAINT ch_SubjectLessons
CHECK (Lessons >= 0)
)

CREATE TABLE StudentsSubjects(
Id INT PRIMARY KEY IDENTITY,
StudentId INT NOT NULL  FOREIGN KEY REFERENCES Students(Id),
SubjectId INT NOT NULL FOREIGN KEY REFERENCES Subjects(Id),
Grade DECIMAL(3,2) CHECK (Grade BETWEEN 2 AND 6)
)

CREATE TABLE Exams(
 Id INT PRIMARY KEY IDENTITY,
 [Date] DATETIME,
 SubjectId INT NOT NULL FOREIGN KEY REFERENCES Subjects(Id)
)

CREATE TABLE StudentsExams(
StudentId INT NOT NULL FOREIGN KEY REFERENCES Students(Id),
ExamId INT NOT NULL FOREIGN KEY REFERENCES Exams(Id),
Grade DECIMAL(3,2) NOT NULL CHECK (Grade BETWEEN 2 AND 6),
CONSTRAINT PK_StudentsExams
PRIMARY KEY(StudentID, ExamId)
)

CREATE TABLE Teachers(
Id INT PRIMARY KEY IDENTITY,
FirstName NVARCHAR(20) NOT NULL,
LastName NVARCHAR(20) NOT NULL,
[Address] NVARCHAR(20) NOT NULL,
Phone CHAR(10),
SubjectId INT NOT NULL FOREIGN KEY REFERENCES Subjects(Id)
)

CREATE TABLE StudentsTeachers(
StudentId INT NOT NULL FOREIGN KEY REFERENCES Students(Id),
TeacherId INT NOT NULL FOREIGN KEY REFERENCES Teachers(Id),
CONSTRAINT PK_StudentsTeachers
PRIMARY KEY(StudentID, TeacherId)
)