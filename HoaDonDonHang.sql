-- Oder Table
CREATE TABLE Oder(
	OderID  INT,
	CustomerID INT,
	OderDate Date,
	Primary Key (OderID, CustomerID)
)

INSERT INTO  Oder VALUES ('1', '113', '2023-4-1')
INSERT INTO  Oder VALUES ('2', '114', '2023-5-7')

DROP TABLE Oder

SELECT * FROM Oder


-- Thong tin khach hang
CREATE TABLE Customer(
	CustomerID INT,
	NameCus NVARCHAR(50),
	Dia_Chi NVARCHAR(100),
	Telephone INT(12),
	FOREIGN KEY (CustomerID) REFERENCES Oder(CustomerID)
)


INSERT INTO  Customer VALUES ('113', 'Alex', 'HaNoi', '012345678')
INSERT INTO  Customer VALUES ('114', 'John', 'DaNang', '01242278')

DROP TABLE Customer

SELECT * FROM Customer


-- Thong tin chi tiet don hang
CREATE TABLE OderDetails(
	OderID  INT,
	ProductID INT,
	PriceMacDinh Money,
	Quantity INT,
	FOREIGN KEY (OderID) REFERENCES Oder(OderID),
	FOREIGN KEY (ProductID) REFERENCES Product(ProductID) 
)

INSERT INTO  OderDetails VALUES ('1', '001', '890', '1')
INSERT INTO  OderDetails VALUES ('2', '002', '1888', '2')


DROP TABLE OderDetails

SELECT * FROM OderDetails


-- Thong tin san pham
CREATE TABLE Product(
	ProductID  INT PRIMARY KEY,
	NameProduct NVARCHAR(50),
	Don_Vi NVARCHAR(10),
	Price Money,
	Quantity INT,
)

INSERT INTO  Product VALUES ('001', 'Quan the thao nam', 'chiec', '1000', '644')
INSERT INTO  Product VALUES ('002', 'Ao the thao nam', 'chiec', '2000', '143')

DROP TABLE Product

SELECT * FROM Product