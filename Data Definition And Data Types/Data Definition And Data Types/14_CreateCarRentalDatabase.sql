CREATE DATABASE CarRental
GO

USE CarRental

CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
CategoryName NVARCHAR(50) NOT NULL,
DailyRate DECIMAL (15,2) NOT NULL,
WeeklyRate DECIMAL(15,2) ,
MonthlyRate DECIMAL(15,2) ,
WeekendRate DECIMAL(15,2),
)

CREATE TABLE Cars(
Id INT PRIMARY KEY IDENTITY,
PlateNumber VARCHAR(50) NOT NULL,
Manufacturer VARCHAR(50) NOT NULL,
Model VARCHAR(50) NOT NULL, 
CarYear INT NOT NULL,
CategoryId INT NOT NULL
FOREIGN KEY(CategoryId) REFERENCES Categories(Id),
Doors INT NOT NULL,
Picture VARBINARY(MAX),
Condition NVARCHAR(MAX),
Available BIT DEFAULT 1 
)

CREATE TABLE Employees(
Id INT PRIMARY KEY IDENTITY ,
FirstName NVARCHAR(50) NOT NULL, 
LastName NVARCHAR(50) NOT NULL, 
Title NVARCHAR(50) NOT NULL, 
Notes NVARCHAR(MAX)
)

CREATE TABLE Customers(
Id INT PRIMARY KEY IDENTITY , 
DriverLicenceNumber INT NOT NULL, 
FullName NVARCHAR(100) NOT NULL, 
Address NVARCHAR(100) NOT NULL, 
City NVARCHAR(50) NOT NULL, 
ZIPCode INT , 
Notes NVARCHAR(MAX)
)

CREATE TABLE RentalOrders(
Id INT PRIMARY KEY IDENTITY, 
EmployeeId INT NOT NULL
FOREIGN KEY(EmployeeId) REFERENCES Employees(Id), 
CustomerId INT NOT NULL
FOREIGN KEY(CustomerId) REFERENCES Customers(Id), 
CarId INT NOT NULL
FOREIGN KEY (CarId) REFERENCES Cars(Id), 
TankLevel INT NOT NULL, 
KilometrageStart DECIMAL(15,2) NOT NULL, 
KilometrageEnd DECIMAL(15,2) NOT NULL, 
TotalKilometrage DECIMAL(15,2) NOT NULL, 
StartDate DATE NOT NULL, 
EndDate DATE NOT NULL, 
TotalDays INT NOT NULL, 
RateApplied DECIMAL(15,2) NOT NULL, 
TaxRate DECIMAL(15,2) NOT NULL, 
OrderStatus NVARCHAR(50) NOT NULL, 
Notes NVARCHAR(MAX)
)


INSERT INTO Categories(CategoryName, DailyRate)
VALUES
('Category1', 10.20),
('Category2', 10.90),
('Category3', 9.20)

INSERT INTO Cars(PlateNumber, Manufacturer, Model, CarYear, CategoryId, Doors)
VALUES
('AA1111AA', 'CAR1', 'CAR1', 2001, 1, 5),
('AA2222AA', 'CAR2', 'CAR2', 2002, 2, 5),
('AA2222AA', 'CAR3', 'CAR3', 2003, 3, 5)

INSERT INTO Employees(FirstName, LastName, Title)
VALUES
('IVAN', 'IVANOV', 'EMPLOYEE'),
('STOQN', 'IVANOV', 'EMPLOYEE'),
('GEORGI', 'IVANOV', 'EMPLOYEE')

INSERT INTO Customers(DriverLicenceNumber,FullName, Address, City)
VALUES
(123456789, 'IVAN IVANOV', 'STREET 1', 'SOFIA'),
(987654321, 'JON IVANOV', 'STREET 2', 'VARNA'),
(678954321, 'JAK IVANOV', 'STREET 3', 'BURGAS')

INSERT INTO RentalOrders
VALUES
(1, 1, 1, 35, 196500, 196900, 400, '2017-05-05', '2017-05-10', 5, 500.96, 100.19, 1, NULL),
(1, 1, 1, 35, 197000, 198500, 1500, '2017-05-12', '2017-05-18', 6, 500.96, 100.19, 1, NULL),
(2, 2, 2, 50, 318000, 320000, 2000, '2017-05-05', '2017-05-10', 5, 500.96, 100.19, 1, NULL)