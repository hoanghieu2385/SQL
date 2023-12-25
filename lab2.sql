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
	WHERE MaLopHoc = 1002
DELETE FROM LopHoc WHERE MaLopHoc = 1102
GO
--SanPham(masp, tensp, gia, loai)

--Tạo bảng Sinh viên có ngoại khóa là cột MaLopHoc, nối với bảng LopHoc
--composive primary key
DROP TABLE SinhVien
CREATE TABLE SinhVien(
	MaSV int PRIMARY KEY,
	TenSV nvarchar(250),
	ClassCode int,
	CONSTRAINT fk FOREIGN KEY (ClassCode) REFERENCES LopHoc(MaLopHoc)
)
GO
INSERT INTO SinhVien(MaSV, TenSV,ClassCode) VALUES (1, 'Minh', 5);
INSERT INTO SinhVien(MaSV, TenSV,ClassCode) VALUES (3, 'Hoa', 1004);
INSERT INTO SinhVien(MaSV, TenSV,ClassCode) VALUES (14, 'Minh', 1007),(16, 'Linh', 1006);
SELECT * FROM SinhVien
SELECT * FROM LopHoc
GO

--Tạo bảng SanPham với một cột NULL, một cột NOT NULL
CREATE TABLE SanPham (
	MaSP int NOT NULL,
	TenSP varchar(40) NULL
)
GO
--Tạo bảng với thuộc tính default cho cột Price
CREATE TABLE StoreProduct(
	ProductID int NOT NULL,
	Name varchar(40) NOT NULL,
	Price money NOT NULL DEFAULT (100)
)

--Thử kiểm tra xem giá trị default có được sử dụng hay không
INSERT INTO StoreProduct (ProductID, Name) VALUES (111, 'Rivets')
GO
--Tạo bảng ContactPhone với thuộc tính IDENTITY
CREATE TABLE ContactPhone (
	Person_ID int IDENTITY (500, 1) NOT NULL,
	MobileNumber bigint NOT NULL
)
GO
--Tạo cột nhận dạng duy nhất tổng thể
CREATE TABLE CellularPhone(
	Person_ID uniqueidentifier DEFAULT NEWID() NOT NULL,
	PersonName varchar(60) NOT NULL
)
--Chèn một record vào
INSERT INTO CellularPhone(PersonName) VALUES('William Smith')
GO
--Kiểm tra giá trị của cột Person_ID tự động sinh
SELECT * FROM CellularPhone
GO
--Tạo bảng ContactPhone với cột MobileNumber có thuộc tính UNIQUE
CREATE TABLE ContactPhone (
	Person_ID int PRIMARY KEY,
	MobileNumber bigint UNIQUE,
	ServiceProvider varchar(30),
	LandlineNumber bigint UNIQUE
)
--Chèn 2 bản ghi có giá trị giống nhau ở cột MobileNumber và LanlieNumber để quan sát lỗi
INSERT INTO  ContactPhone VALUES (101, 983345674, 'Hutch', NULL)
INSERT INTO  ContactPhone VALUES (101, 983345674, 'Alex', NULL)
GO
--Tạo bảng PhoneExpenses có một CHECT ở cột Amount
CREATE TABLE PhoneExpenses (
	Expenses_ID int PRIMARY KEY,
	MobileNumber bigint FOREIGN KEY REFERENCES ContactPhone(MobileNumber),\
	Amount bigint CHECK (Amount > 0)
)
GO
--Chỉnh sửa cột trong bảng
ALTER TABLE ContactPhone
ALTER COLUMN ServiceProvider varchar(45)
GO
--Xóa cột trong bảng
ALTER TABLE ContactPhone
DROP COLUMN ServiceProvider
GO
---Them một ràng buộc vào bảng
ALTER TABLE ContactPhone ADD CONSTRAINT CHK_RC CHECK(RentalCharges >0)
GO
--Xóa một ràng buộc
ALTER TABLE Person.ContactPhone
DROP CONSTRAINT CHK_RC