﻿CREATE TABLE Book (
	Tên_cột NVARCHAR(30),
	Kiểu_dữ_liệu NVARCHAR(20),
	Kích_cỡ NVARCHAR(20),
	Mô_tả NVARCHAR(200)
)
GO

INSERT INTO  Book VALUES (N'BookCode', N'int', N'Mặc định', N'Dùng để xác định mỗi cuốn sách
	Tên_cột NVARCHAR(30),
	Kiểu_dữ_liệu NVARCHAR(20),
	Kích_cỡ NVARCHAR(20),
	Mô_tả NVARCHAR(200)
)
GO

INSERT INTO  Members VALUES (N'MemberCode', N'int', N'Mặc định', N'Dùng để xác định người mượn là
	Tên_cột NVARCHAR(30),
	Kiểu_dữ_liệu NVARCHAR(20),
	Kích_cỡ NVARCHAR(20),
	Mô_tả NVARCHAR(200)
)
GO

INSERT INTO  IssueDetails VALUES (N'BookCode', N'int', N'Mặc định', N'Mã cuốn sách có trong bảng Book')