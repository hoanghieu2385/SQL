IF EXITS (SELECT * FROM sys.databases WHERE Name LIKE 'Example5')
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
INSERT INTO LopHoc(TenLopHoc) VALUES ('T2308M')
SELECT * FROM LopHoc
UPDATE LopHoc SET TenLopHoc = 'T2308M'
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