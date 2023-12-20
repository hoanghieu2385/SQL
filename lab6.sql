CREATE TABLE Category (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50),
    A NVARCHAR(50),
    B NVARCHAR(50),
    C NVARCHAR(50)
);
GO

INSERT INTO Category values ( N'A', N'A', N'A', N'A')
INSERT INTO Category values ( N'B', N'B', N'B', N'B')
INSERT INTO Category values ( N'C', N'C', N'C', N'C')
INSERT INTO Category values ( N'D', N'D', N'D', N'D')


SELECT * FROM Category;

DROP TABLE Category;

CREATE TABLE Product (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(50),
    Price MONEY,
    Description NVARCHAR(200),
    Id_cot INT,
    FOREIGN KEY (Id_cot) REFERENCES Category(Id)
);

INSERT INTO Product values ( N'A', 200, N'A', 1)
INSERT INTO Product values ( N'B', 100, N'B', 2)
INSERT INTO Product values ( N'C', 50, N'C', 3)



SELECT * FROM Product;

DROP TABLE Product;

--Hien thi 2 bang
SELECT * FROM Category;
SELECT * FROM Product;

