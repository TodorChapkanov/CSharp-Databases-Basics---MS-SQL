CREATE TABLE Users(
Id INT PRIMARY KEY IDENTITY(1,1),
Username VARCHAR(30) UNIQUE NOT NULL,
Password VARCHAR(26) NOT NULL,
ProfilePicture VARBINARY(900),
LastLoginTime DATE,
IsDeleted BIT
)

INSERT INTO Users(Username, Password)
VALUES
('Usename1','123456789'),
('Usename2','123456789'),
('Usename3','123456789'),
('Usename4','123456789'),
('Usename5','123456789')