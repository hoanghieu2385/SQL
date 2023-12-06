CREATE TABLE Contacts
(	USERID INT,
	FirstName NVARCHAR(30),
	LastName NVARCHAR(30),
	Age INT,
	Email NVARCHAR(50))


INSERT INTO Contacts values (1, N'John', N'Doe', 25, N'@gmail.com')
INSERT INTO Contacts values (2, N'John', 'Doe', 25, N'@gmail.com')
INSERT INTO Contacts values (3, N'John', 'Doe', 25, N'@gmail.com')
INSERT INTO Contacts values (4, N'John', 'Doe', 25, N'@gmail.com')

SELECT * FROM Contacts

DROP TABLE Contacts