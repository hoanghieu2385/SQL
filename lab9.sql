-- DROP TABLE PhongBan
CREATE TABLE PhongBan(
	MaPB VARCHAR(7) PRIMARY KEY,
	TenPB NVARCHAR(50)
)
GO


INSERT INTO PhongBan VALUES ('1', 'PhongBan1')
INSERT INTO PhongBan VALUES ('2', 'PhongBan2')
INSERT INTO PhongBan VALUES ('3', 'PhongBan3')
INSERT INTO PhongBan VALUES ('4', 'PhongBan4')
INSERT INTO PhongBan VALUES ('5', 'PhongBan5')
GO

SELECT * FROM PhongBan


-- DROP TABLE NhanVien
CREATE TABLE NhanVien(
	MaNV VARCHAR(7) PRIMARY KEY,
	TenNV NVARCHAR(50),
	NgaySinh Datetime,
	SoCMND CHAR(6),
	GioiTinh NVARCHAR(1),
	DiaChi NVARCHAR(100),
	NgayVaoLam Datetime,
	MaPB VARCHAR(7)
	FOREIGN KEY (MaPB) REFERENCES PhongBan(MaPB) 
)
GO


INSERT INTO NhanVien VALUES ('01', N'TenNV1', '1994-04-23', 000001, 'F', 'DiaChi-1', 2018-03-18, 1)
INSERT INTO NhanVien VALUES ('02', N'TenNV2', '1997-04-27', 000002, 'M', 'DiaChi-2', 2020-02-18, 2)
INSERT INTO NhanVien VALUES ('03', N'TenNV3', '1999-07-23', 000003, 'F', 'DiaChi-3', 2021-03-16, 3)
INSERT INTO NhanVien VALUES ('04', N'TenNV4', '1993-04-21', 000004, 'M', 'DiaChi-4', 2022-04-18, 4)
INSERT INTO NhanVien VALUES ('05', N'TenNV5', '1995-01-23', 000005, 'M', 'DiaChi-5', 2017-01-18, 5)
INSERT INTO NhanVien VALUES ('06', N'TenNV6', '2000-05-23', 000006, 'F', 'DiaChi-6', 2015-01-18, 2)
INSERT INTO NhanVien VALUES ('07', N'TenNV7', '2000-04-03', 000007, 'F', 'DiaChi-7', 2015-07-18, 2)


GO


SELECT * FROM NhanVien



-- DROP TABLE LuongDA
CREATE TABLE LuongDA(
	MaDA VARCHAR(8),
	MaNV VARCHAR(7),
	NgayNhan Datetime,
	SoTien Money CHECK (Sotien > 0),
	PRIMARY KEY (MaDA, MaNV),
	FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
)
GO


INSERT INTO LuongDA VALUES ('001', '01', '2022-08-23', 1000)
INSERT INTO LuongDA VALUES ('012', '02', '2021-01-13', 2000)
INSERT INTO LuongDA VALUES ('023', '03', '2027-04-03', 3000)
INSERT INTO LuongDA VALUES ('034', '04', '2024-03-24', 4000)
INSERT INTO LuongDA VALUES ('045', '01', '2023-02-21', 5000)
INSERT INTO LuongDA VALUES ('056', '02', '2023-02-21', 6000)
INSERT INTO LuongDA VALUES ('067', '05', '2023-02-21', 7000)
INSERT INTO LuongDA VALUES ('078', '02', '2024-02-21', 8000)
INSERT INTO LuongDA VALUES ('089', '07', '2022-05-25', 9000)
INSERT INTO LuongDA VALUES ('099', '05', '2023-02-21', 10000)



GO


SELECT * FROM LuongDA


DROP TABLE LuongDA
GO
DROP TABLE NhanVien
GO
DROP TABLE PhongBan
GO



-- Viết một query để hiển thị thông tin về các bảng LUONGDA, NHANVIEN, PHONGBAN.
SELECT * FROM PhongBan
SELECT * FROM NhanVien
SELECT * FROM LuongDA

-- Viết một query để hiển thị những nhân viên có giới tính là ‘F’.
SELECT * FROM NhanVien
WHERE GioiTinh LIKE 'F'

-- Hiển thị tất cả các dự án, mỗi dự án trên 1 dòng.
SELECT MaDA FROM LuongDA

-- Hiển thị tổng lương của từng nhân viên (dùng mệnh đề GROUP BY).
SELECT MaNV, Sum(SoTien) AS TongLuong FROM LuongDA
GROUP BY MaNV

-- Hiển thị tất cả các nhân viên trên một phòng ban cho trước (VD: ‘Hành chính’).
SELECT * FROM NhanVien
WHERE MaPB = '2
'

-- Hiển thị mức lương của những nhân viên phòng 2.
SELECT MaPB, MaNV FROM NhanVien
Where MaPB = '2'

SELECT NhanVien.MaNV,
	NhanVien.TenNV,
	LuongDA.SoTien
FROM NhanVien
JOIN LuongDA ON NhanVien.MaNV = LuongDA.MaNV
WHERE NhanVien.MaPB = '2';


-- Hiển thị số lượng nhân viên của từng phòng
SELECT MaPB, Count(*) AS SoLuongNhanVien
FROM NhanVien
Group BY MaPB;

-- Viết một query để hiển thị những nhân viên mà tham gia ít nhất vào một dự án.
SELECT DISTINCT TenNV, MaNV FROM NhanVien
WHERE MaNV != '0'


-- Viết một query hiển thị phòng ban có số lượng nhân viên nhiều nhất.
SELECT TOP 1 NV.MaPB, COUNT(NV.MaNV) AS SoLuongNhanVien
FROM NhanVien NV
GROUP BY NV.MaPB
ORDER BY SoLuongNhanVien DESC;

-- Tính tổng số lượng của các nhân viên trong phòng 2.
SELECT PB.TenPB, COUNT(NV.MaNV) AS TongSoLuongNhanVien
FROM PhongBan PB
JOIN NhanVien NV ON PB.MaPB = NV.MaPB
WHERE PB.MaPB = '2'
GROUP BY PB.TenPB;


-- Xoá dự án có mã dự án là 99.
DELETE FROM LuongDA WHERE MaDA='099'
SELECT MaDA FROM LuongDA


--Xoá đi từ bảng LuongDA những nhân viên có mức lương 2000.
DELETE FROM LuongDA WHERE SoTien='2000'
SELECT * FROM LuongDA


--Cập nhật lại lương cho những người tham gia dự án 001 thêm 10% lương cũ.
UPDATE LuongDA
SET SoTien = SoTien * 1.1
WHERE MaDA = '001';
SELECT * FROM LuongDA


-- Xoá các bản ghi tương ứng từ bảng NhanVien đối với những nhân viên không có mã nhân viên tồn tại trong bảng LuongDA.
DELETE FROM NhanVien
WHERE NOT EXISTS (
    SELECT 1
    FROM LuongDA
    WHERE LuongDA.MaNV = NhanVien.MaNV
);
