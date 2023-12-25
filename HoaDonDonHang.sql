-- Thong tin khach hang
CREATE TABLE Customer(
	CustomerID INT PRIMARY KEY,
	NameCus NVARCHAR(50),
	Dia_Chi NVARCHAR(100),
	Telephone INT
)


INSERT INTO  Customer VALUES ('113', 'Xuan', 'HaNoi', '012345678')
INSERT INTO  Customer VALUES ('114', 'Lam', 'DaNang', '01242278')
INSERT INTO  Customer VALUES ('115', 'Tung', 'TayNguyen', '0120478')
INSERT INTO  Customer VALUES ('116', 'Hieu', 'HoChiMinh', '01266278')
INSERT INTO  Customer VALUES ('117', 'Nguyễn Văn An', 'VungTau', '01244648')



DROP TABLE Customer

SELECT * FROM Customer


-- Thong tin san pham
CREATE TABLE Product(
	ProductID  INT PRIMARY KEY,
	NameProduct NVARCHAR(50),
	Don_Vi NVARCHAR(10),
	Price Money,
	Quantity INT,
)

INSERT INTO  Product VALUES ('001', 'Quan the thao nam', 'chiec', '1000', '644')
INSERT INTO  Product VALUES ('002', 'Ao the thao nam', 'chiec', '800', '1543')
INSERT INTO  Product VALUES ('003', 'May tinh cu', 'chiec', '6000', '14')
INSERT INTO  Product VALUES ('004', 'Dien thoai iphone 15pro max', 'chiec', '2300', '54')
INSERT INTO  Product VALUES ('005', 'Ban hoc', 'chiec', '2500', '212')


DROP TABLE Product

SELECT * FROM Product


-- Thong Tin Chung
CREATE TABLE Oder(
	OderID  INT PRIMARY KEY,
	CustomerID INT,
	OderDate Date,
	FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) 
)

INSERT INTO  Oder VALUES ('1', '113', '2021-4-1')
INSERT INTO  Oder VALUES ('2', '114', '2021-9-7')
INSERT INTO  Oder VALUES ('3', '115', '2022-10-3')
INSERT INTO  Oder VALUES ('4', '116', '2023-6-1')
INSERT INTO  Oder VALUES ('5', '117', '2023-9-2')


DROP TABLE Oder

SELECT * FROM Oder


-- Thong tin chi tiet don hang
CREATE TABLE OderDetails(
	OderID  INT,
	ProductID INT,
	PriceSale Money,
	Quantity INT,
	PRIMARY KEY (OderID, ProductID),
	FOREIGN KEY (OderID) REFERENCES Oder(OderID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID) 
)

INSERT INTO  OderDetails VALUES 
		('1', '001', '888', '1'),
		('1', '003', '5899', '1'),
		('1', '004', '2222', '2');


INSERT INTO  OderDetails VALUES 
		('2', '002', '777', '1'),
		('2', '003', '5899', '1'),
		('2', '005', '2399', '2');

INSERT INTO  OderDetails VALUES 
		('3', '002', '777', '2'),
		('3', '003', '5899', '1');

INSERT INTO  OderDetails VALUES 
		('4', '005', '2399', '1');

INSERT INTO  OderDetails VALUES 
		('5', '004', '2222', '1'),
		('5', '001', '888', '1');

DROP TABLE OderDetails

SELECT * FROM OderDetails


DROP TABLE OderDetails, Oder, Product, Customer
SELECT * FROM Customer
SELECT * FROM Product
SELECT * FROM Oder
SELECT * FROM OderDetails


------------------------------------------------ 4-a
SELECT CustomerID,NameCus FROM Customer

------------------------------------------------ 4-b
SELECT ProductID,NameProduct FROM Product

------------------------------------------------ 4-c
SELECT * FROM Oder

------------------------------------------------ 5-a
SELECT * FROM Customer
ORDER BY NameCus;

------------------------------------------------ 5-b
SELECT * FROM Product
ORDER BY Price;

------------------------------------------------ 5-c
SELECT P.NameProduct, OD.PriceSale, OD.Quantity
FROM OderDetails AS OD
JOIN Product AS P ON OD.ProductID = P.ProductID
JOIN Oder AS O ON OD.OderID = O.OderID
JOIN Customer AS C ON O.CustomerID = C.CustomerID
WHERE C.NameCus = 'Nguyễn Văn An';

------------------------------------------------ 6-a
SELECT Count(NameCus) AS So_khach_hang_da_mua FROM Customer

------------------------------------------------ 6-b
SELECT Count(NameCus) AS So_khach_hang_da_mua FROM Customer

------------------------------------------------ 6-c
SELECT O.OderID, SUM(OD.PriceSale * OD.Quantity) AS TotalAmount
FROM OderDetails OD
JOIN Oder O ON OD.OderID = O.OderID
GROUP BY O.OderID;


