USE AdventureWorks2022
GO

SELECT * FROM HumanResources.Employee
SELECT * FROM HumanResources.Department WHERE DepartmentID > 15

SELECT DepartmentID, Name, GroupName FROM HumanResources.Department WHERE DepartmentID > 15
-- Khai báo biến
Go
DECLARE @deptID INT --Khai báo biến cục bộ tên là deptID kiểu int
SELECT @deptID=12 --Gán giá trị cho biến bằng 1
SELECT DepartmentID, Name, GroupName FROM HumanResources.Department
						WHERE DepartmentID >= @deptID
Go

USE Northwind
GO
SELECT * FROM Categories
SELECT CategoryID, CategoryName, [Description] FROM Categories
SELECT EmployeeID, LastName, FirstName FROM Employees
SELECT TOP 1 * FROM Employees

SELECT @@LANGUAGE -- Hiển thị thông tin của biến toàn cục @@LANGUAGE, trả lại thông tin ngôn ngữ sử dụng trong sql server
SELECT @@VERSION -- Hiển thị thông tin của biến toàn cục @@VERSION, trả lại thông tin về phiên bản sql server

Go

--Lấy tổng tất cả giá trị các phiên bản ghi trường StandarCost thuộc bảng ProductCostHistory
SELECT SUM(StandardCost) FROM Production.ProductCostHistory
--Lấy giá trị trung bình tất cả giá trị các phiên bản ghi trường StandarCost thuộc bảng ProductCostHistory
SELECT AVG(StandardCost) FROM Production.ProductCostHistory
--Lấy ra giá trị lớn nhất tất cả giá trị các phiên bản ghi trường StandarCost thuộc bảng ProductCostHistory
SELECT MAX(StandardCost) FROM Production.ProductCostHistory
-- Đếm tổng số bản ghi trong bảng ProductPhoto
SELECT COUNT(*) AS TotalRecords FROM Production.ProductPhoto
-- Lấy ra ngày giờ hệ thống
SELECT GETDATE()
-- Lấy ra giờ hệ thống
SELECT DATEPART(hh,GETDATE())
-- Định dạng ngày dùng hàm CONVERT
SELECT CONVERT(VarChar(50), GETDATE(), 103)



--Lấy ra định danh của cơ sở dữ liệu
SELECT DB_ID('AdventureWorks')

-- Tạo cơ sở dữ liệu:
CREATE DATABASE EXAMPLE3

USE Example3

-- Tạo bảng trong cơ sở dữ liệu
CREATE TABLE Contacts
(MailID VARCHAR(20),
	Name NTEXT,
	TelephoneNumber INT)

-- Thêm 1 cột vào bảng đã có:
AlTER TABLE Contacts ADD Address NVARCHAR(250)

--Thêm dữ liệu vào bảng Contacts:
INSERT INTO Contacts values ('xeko@gmail.com', N'Nguyễn Văn A', 98989898, N'Hà Nội')
INSERT INTO Contacts values ('lynka@gmail.com', N'Nguyen Thị B', 4329423, N'Hà Nội')
INSERT INTO Contacts values ('tranvanC@gmail.com', N'Trần Văn C', 905243524, N'Hà Nội')
INSERT INTO Contacts values ('vand@gmail.com', N'Trinh Văn D', 4563576, N'Hà Nội')

--Lấy ra tất cả bản gjo trong bảng
SELECT * FROM Contacts

-- Xóa bản ghi
DELETE FROM Contacts WHERE MailID='tranvanC@gmail.com'

-- Sửa bản ghi
UPDATE Contacts SET Name=N'Nguyen Viet Anh' WHERE MailID='vand@gmail.com'

--Tạo login account để test GRANT
CREATE LOGIN example3 WITH PASSWORD='123456'

-- Tạo user từ login account vừa tạo
CREATE USER example3 FROM LOGIN example3

--Hủy bỏ tất cả các quyền của user example3 trên bảng Contacts
REVOKE ALL ON Contacts FROM example3
--Disconnect và connect lại với user example3/123456, thực hiện câu lệnh select để demo cho sinh viên thấy user không còn bất kỳ quyền nào trên bảng Contact trong cơ sở dữ liệu

--Gán quyền SELECT cho example3 trên bảng Contacts
GRANT SELECT ON Contacts TO example3