CREATE DATABASE TEST
GO 
USE TEST
GO

CREATE TABLE Models(
ModelID INT NOT NULL,
[Name] VARCHAR(20) NOT NULL,
ManufacturerID INT 
)

GO

CREATE TABLE Manufacturers(
ManufacturerID INT NOT NULL,
[Name] VARCHAR(20),
EstablishedOn DATE
)

GO
 INSERT INTO Models(ModelID, [Name], ManufacturerID)
 VALUES
(101,'X1',1),
(102,'i6', 1),
(103,'Model S',	2),
(104,'Model X',	2),
(105,'Model 3',	2),
(106,'Nova', 3)


GO 
INSERT INTO Manufacturers(ManufacturerID, [Name], EstablishedOn)
VALUES
(1,'BMW', '07/03/1916'),
(2,	'Tesla', '01/01/2003'),
(3,	'Lada', '01/05/1966')


GO

ALTER TABLE Models
ADD CONSTRAINT PK_Models
PRIMARY KEY(ModelID)

GO

ALTER TABLE Manufacturers
ADD CONSTRAINT PK_Manufacturer
PRIMARY KEY(ManufacturerID)

GO

ALTER TABLE Models
ADD CONSTRAINT FK_Model_Manufacturer
FOREIGN KEY(ManufacturerID) REFERENCES Manufacturers(ManufacturerID)

