CREATE DATABASE Hotel

GO

USE Hotel

CREATE TABLE Employees(
Id INT PRIMARY KEY IDENTITY, 
FirstName NVARCHAR(50) NOT NULL, 
LastName NVARCHAR(50) NOT NULL, 
Title NVARCHAR(50) NOT NULL, 
Notes NVARCHAR(MAX)
)

CREATE TABLE Customers(
AccountNumber INT PRIMARY KEY IDENTITY, 
FirstName NVARCHAR(50) NOT NULL, 
LastName NVARCHAR(50) NOT NULL, 
PhoneNumber VARCHAR(20) NOT NULL, 
EmergencyName NVARCHAR(50) NOT NULL, 
EmergencyNumber VARCHAR(20) NOT NULL, 
Notes NVARCHAR(MAX)
)

CREATE TABLE RoomStatus(
RoomStatus NVARCHAR(50) PRIMARY KEY NOT NULL, 
Notes NVARCHAR(MAX)
)

CREATE TABLE RoomTypes(
RoomType NVARCHAR(100) PRIMARY KEY NOT NULL, 
Notes NVARCHAR(MAX)
)

CREATE TABLE BedTypes(
BedType NVARCHAR(100) PRIMARY KEY NOT NULL, 
Notes NVARCHAR(MAX)
)

CREATE TABLE Rooms(
RoomNumber INT PRIMARY KEY NOT NULL, 
RoomType NVARCHAR(100) NOT NULL
FOREIGN KEY REFERENCES RoomTypes(RoomType), 
BedType NVARCHAR(100) NOT NULL
FOREIGN KEY REFERENCES BedTypes(BedType), 
Rate DECIMAL(15,2) NOT NULL, 
RoomStatus NVARCHAR(50) NOT NULL
FOREIGN KEY REFERENCES RoomStatus(RoomStatus), 
Notes NVARCHAR(MAX)
)

CREATE TABLE Payments(
Id BIGINT PRIMARY KEY IDENTITY, 
EmployeeId INT NOT NULL
FOREIGN KEY REFERENCES Employees(Id),
PaymentDate DATE NOT NULL, 
AccountNumber INT NOT NULL
FOREIGN KEY REFERENCES Customers(AccountNumber), 
FirstDateOccupied DATE , 
LastDateOccupied DATE , 
TotalDays INT, 
AmountCharged DECIMAL(15,2) NOT NULL, 
TaxRate DECIMAL(15,2), 
TaxAmount DECIMAL(15,2) NOT NULL, 
PaymentTotal DECIMAL(15,2) NOT NULL, 
Notes NVARCHAR(MAX)
)

CREATE TABLE Occupancies(
Id INT PRIMARY KEY IDENTITY, 
EmployeeId INT NOT NULL
FOREIGN KEY REFERENCES Employees(Id), 
DateOccupied DATE NOT NULL, 
AccountNumber INT NOT NULL, 
RoomNumber INT NOT NULL
FOREIGN KEY REFERENCES Rooms(RoomNumber), 
RateApplied DECIMAL(15,2), 
PhoneCharge DECIMAL(15,2), 
Notes NVARCHAR(MAX)
)

GO

INSERT INTO Employees(FirstName,LastName, Title)
 VALUES('IVAN', 'IVANOV', 'Receptionist')
INSERT INTO Employees(FirstName,LastName, Title)
 VALUES('PETKO', 'PETKOV', 'Receptionist')
INSERT INTO Employees(FirstName,LastName, Title)
 VALUES('STAMO', 'STAMOV', 'Receptionist')
 
INSERT INTO Customers( FirstName, LastName, PhoneNumber,EmergencyName,EmergencyNumber) VALUES('C-1', 'C-1', '123', 'AAA', '123')
INSERT INTO Customers( FirstName, LastName, PhoneNumber, EmergencyName,EmergencyNumber) VALUES('C-2', 'C-2', '456', 'AAA', '123')
INSERT INTO Customers( FirstName, LastName, PhoneNumber, EmergencyName,EmergencyNumber) VALUES('C-3', 'C-3', '789', 'AAA', '123')
 
INSERT INTO RoomStatus VALUES('1', 'FREE')
INSERT INTO RoomStatus VALUES('2', 'OCCUPIED')
INSERT INTO RoomStatus VALUES('3', 'NOT SURE')
 
INSERT INTO RoomTypes VALUES('1', '1')
INSERT INTO RoomTypes VALUES('2', '2')
INSERT INTO RoomTypes VALUES('3', '3')
 
INSERT INTO BedTypes VALUES('1', '1')
INSERT INTO BedTypes VALUES('2', '2')
INSERT INTO BedTypes VALUES('3', '3')
 
INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus) 
VALUES(1, '1', '1', 1, '1')
INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus) 
VALUES(2, '2', '2', 1, '2')
INSERT INTO Rooms(RoomNumber, RoomType, BedType, Rate, RoomStatus) 
VALUES(3, '3', '3', 1, '3')
 
INSERT INTO Payments 
(EmployeeID, PaymentDate, AccountNumber, AmountCharged, TaxAmount, PaymentTotal)
 VALUES
 (1, GETDATE(), 1, 1, 1, 1)

INSERT INTO Payments
(EmployeeID, PaymentDate, AccountNumber, AmountCharged, TaxAmount, PaymentTotal)
 VALUES
 (2, GETDATE(), 2, 1, 1, 1)

INSERT INTO Payments 
(EmployeeID, PaymentDate, AccountNumber, AmountCharged, TaxAmount, PaymentTotal) 
VALUES
(3, GETDATE(), 3, 1, 1, 2)

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber) 
VALUES (1, GETDATE(), 123, 1)

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber)
VALUES (2, GETDATE(), 122, 1)

INSERT INTO Occupancies(EmployeeId, DateOccupied, AccountNumber, RoomNumber) 
VALUES (3, GETDATE(), 125, 1)