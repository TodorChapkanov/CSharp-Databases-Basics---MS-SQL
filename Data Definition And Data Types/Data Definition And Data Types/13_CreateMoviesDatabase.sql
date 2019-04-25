CREATE DATABASE Movies

USE Movies

CREATE TABLE Directors(
Id INT PRIMARY KEY IDENTITY ,
DirectorName NVARCHAR(100) NOT NULL,
Notes NVARCHAR(MAX)
)

CREATE TABLE Genres(
Id INT PRIMARY KEY IDENTITY,
GenreName NVARCHAR(100) NOT NULL,
Notes NVARCHAR(MAX)
)

CREATE TABLE Categories(
Id INT PRIMARY KEY IDENTITY,
CategoryName NVARCHAR(100),
Notes NVARCHAR(MAX)
)

CREATE TABLE Movies(
Id INT PRIMARY KEY IDENTITY ,
Title NVARCHAR(200) NOT NULL,
DirectorId INT NOT NULL,
CopyrightYear DATE,
Length DECIMAL(15,2) NOT NULL,
GenreId INT NOT NULL,
CategoryId INT NOT NULL,
Rating INT,
Notes NVARCHAR(MAX)
)

ALTER TABLE Movies
ADD CONSTRAINT FK_DirectorId
FOREIGN KEY(DirectorId) REFERENCES Directors(Id)

ALTER TABLE Movies
ADD CONSTRAINT FK_GenreId
FOREIGN KEY(GenreId) REFERENCES Genres(Id)

ALTER TABLE Movies
ADD CONSTRAINT FK_CategoryId
FOREIGN KEY(CategoryId) REFERENCES Categories(Id)

INSERT INTO Directors(DirectorName)
VALUES
('Ivan Ivanov'),
('Georgi Georgiev'),
('Petar Petrov'),
('Tihomir Ivanov'),
('Simo Simov')

INSERT INTO Genres(GenreName)
VALUES 
('Action'),
('Adventure'),
('Comedy'),
('Crime'),
('Drama')

INSERT INTO Categories(CategoryName)
VALUES
('Categorie_1'),
('Categorie_2'),
('Categorie_3'),
('Categorie_4'),
('Categorie_5')

INSERT INTO Movies(Title, DirectorId, Length, GenreId, CategoryId)
VALUES
('Movie1', 1, 1.1, 1, 1),
('Movie2', 2, 1.1, 2, 2),
('Movie3', 3, 1.1, 3, 3),
('Movie4', 4, 1.1, 4, 4),
('Movie5', 5, 1.1, 5, 5)