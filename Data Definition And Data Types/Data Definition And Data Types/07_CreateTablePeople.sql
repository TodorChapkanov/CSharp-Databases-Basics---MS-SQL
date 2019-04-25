CREATE TABLE People(
Id INT PRIMARY KEY IDENTITY NOT NULL,
[Name] NVARCHAR(200) NOT NULL,
Picture VARBINARY(MAX),
Height DECIMAL (15,2),
[Weight] DECIMAL (15,2),
Gender VARCHAR (1) NOT NULL,
Birthdate DATE NOT NULL,
Biography NVARCHAR(MAX)

)



INSERT INTO People([Name], Gender, Birthdate)
VALUES
('Pesho Peshev', 'm', '19840912'),
('Gosho Goshov', 'm', '19660124'),
('Vanio Vaniov', 'm', '19830909'),
('Pepa Pepova', 'f', '19990101'),
('Ivanka Ivanova', 'f', '20000101')