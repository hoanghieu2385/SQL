CREATE TABLE ProductName
(	MaLoai INT IDENTITY,
	TenLoai TEXT
)

SELECT * FROM ProductName

INSERT INTO ProductName VALUES ('Mobile');
INSERT INTO ProductName VALUES ('Laptop');
INSERT INTO ProductName VALUES ('Máy tính bảng');

CREATE TABLE Products
(	MaSanPham INT IDENTITY,
	TenSanPham TEXT,
	Gia DECIMAL(10,2),
	MaLoai INT
)

DROP TABLE Products

INSERT INTO Products VALUES ('iPhone 13', 1200, 1);
INSERT INTO Products VALUES ('Dell XPS 13', 1500, 2);

SELECT * FROM Products
SELECT * FROM ProductName
