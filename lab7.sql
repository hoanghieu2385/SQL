IF EXISTS (SELECT * FROM sys.databases WHERE Name LIKE 'Example5')
	DROP DATABASE Example5
GO
CREATE DATABASE Example5
GO
USE Example5
GO
--DDL: CREATE, ALTER, DROP
--DML: INSERT, UPDATE, DELETE
--CTTRL + /
--DATABASE IN SQL
--Tạo bảng lớp học
CREATE TABLE LopHoc(
	MaLopHoc INT PRIMARY KEY IDENTITY,
	TenLopHoc VARCHAR(10)
)
GO
SELECT * FROM LopHoc
GO

INSERT INTO LopHoc(TenLopHoc) VALUES ('T2009M')
SELECT * FROM LopHoc

UPDATE LopHoc SET TenLopHoc = 'T2209M'
	WHERE MaLopHoc = 1

DELETE FROM LopHoc WHERE MaLopHoc = 2
GO
--SanPham(masp, tensp, gia, loai)

--Tạo bảng Sinh viên có ngoại khóa là cột MaLopHoc, nối với bảng LopHoc
--composive primary key

-- DROP TABLE SinhVien
CREATE TABLE SinhVien(
	MaSV int PRIMARY KEY,
	TenSV nvarchar(250),
	ClassCode int,
	CONSTRAINT fk FOREIGN KEY (ClassCode) REFERENCES LopHoc(MaLopHoc)
)
GO
INSERT INTO SinhVien(MaSV, TenSV,ClassCode) VALUES (1, 'Minh', 5);
INSERT INTO SinhVien(MaSV, TenSV,ClassCode) VALUES (3, 'Hoa', 111);
INSERT INTO SinhVien(MaSV, TenSV,ClassCode) VALUES (14, 'Minh', 3),(16, 'Linh', 4);
SELECT * FROM SinhVien
SELECT * FROM LopHoc
GO


--Tạo bảng SanPham với một cột NULL, một cột NOT NULL
CREATE TABLE SanPham (
	MaSP int NOT NULL,
	TenSP varchar(40) NULL
)
GO
INSERT INTO  SanPham(MaSP, TenSP) VALUES (1, 'Laptop')
GO
INSERT INTO  SanPham(TenSP) VALUES ('Laptop2')
GO
INSERT INTO  SanPham( MaSP) VALUES (2)
GO

SELECT * FROM SanPham


-- DROP TABLE StoreProduct
CREATE TABLE StoreProduct(
	ProductID int NOT NULL,
	Name varchar(40) NOT NULL,
	Price money NOT NULL DEFAULT (100)
)
GO

--Thử kiểm tra xem giá trị default có được sử dụng hay không
INSERT INTO StoreProduct (ProductID, Name) VALUES (111, 'Rivets')
GO

SELECT * FROM StoreProduct


-- DROP TABLE ContactPhone
CREATE TABLE ContactPhone (
	Person_ID int IDENTITY (500, 10) NOT NULL,
	MobileNumber bigint NOT NULL
)
GO

INSERT INTO  ContactPhone VALUES (984123123);
INSERT INTO  ContactPhone VALUES (984123124);
GO
SELECT * FROM ContactPhone
GO

-- DROP TABLE CellularPhone
CREATE TABLE CellularPhone(
	Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
	PersonName varchar(60) NOT NULL
)
INSERT INTO  CellularPhone(PersonName) VALUES('William Smith')
GO
SELECT * FROM CellularPhone
GO


-- DROP TABLE ContactPhone2
CREATE TABLE ContactPhone2(
	Person_ID int PRIMARY KEY,
	MobileNumber bigint UNIQUE,
	ServiceProvider varchar(30),
	LandlineNumber bigint UNIQUE
)
GO

INSERT INTO  ContactPhone2 VALUES (101, 0983345674, 'Hutch', NULL)
INSERT INTO  ContactPhone2 VALUES (103, 0983345672, 'Alex', 98332211)
INSERT INTO  ContactPhone2 VALUES (103, NULL, 'Alex', 98332211)
GO
-- lỗi dòng 115 với 116 do trùng Person_ID, LandlineNumber

SELECT * FROM ContactPhone2
GO