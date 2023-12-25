CREATE TABLE HangDetails(
	Ma_So_Hang INT PRIMARY KEY ,
	Ten_Hang NVARCHAR(30),
	Address_Hang NVARCHAR(100),
	Tel_Hang INT,
)
INSERT INTO HangDetails VALUES ('123', N'Asus', N'USA', '983232')
INSERT INTO HangDetails VALUES ('124', N'Apple', N'TrungQuoc', '9832312')
INSERT INTO HangDetails VALUES ('125', N'SamSung', N'NhatBan', '9832432')
INSERT INTO HangDetails VALUES ('126', N'Xiaomi', N'TrungQuoc', '9583232')
INSERT INTO HangDetails VALUES ('127', N'Dell', N'VietNam', '9873232')



DROP TABLE HangDetails

SELECT * FROM HangDetails


CREATE TABLE Product(
	ProductID INT PRIMARY KEY,
	Ma_So_Hang INT,
	NameProduct NVARCHAR(100),
	Mo_Ta_San_Pham NVARCHAR(200),
	Don_Vi NVARCHAR(10),
	Price Money,
	So_Luong_Hien_Co INT,
	FOREIGN KEY (Ma_So_Hang) REFERENCES HangDetails(Ma_So_Hang) 
)

INSERT INTO Product VALUES ('001', '123', N'Máy Tính T450', N'Máy nhập cũ', N'Chiếc', '1000', '10')
INSERT INTO Product VALUES ('002', '123', N'Điện Thoại Nokia5670', N'Điện thoại đang hot', N'Chiếc', '200', '200')
INSERT INTO Product VALUES ('003', '123', N'Máy In Samsung450', N'Máy in đang loại bình', N'Chiếc', '100', '10')
INSERT INTO Product VALUES ('004', '125', N'SamSung U23 Utral', N'Điện thoại xịn', N'Chiếc', '330', '9')
INSERT INTO Product VALUES ('005', '126', N'XiaoMi12', N'Điện thoại xịn', N'Chiếc', '120', '4')



DROP TABLE Product

SELECT * FROM Product


DROP TABLE Product, HangDetails


SELECT * FROM HangDetails
SELECT * FROM Product


---------------------------------------------- 4-a
SELECT Ten_Hang FROM HangDetails

---------------------------------------------- 4-a
SELECT NameProduct FROM Product

---------------------------------------------- 5-a
SELECT Ten_Hang FROM HangDetails
ORDER BY Ten_Hang DESC

---------------------------------------------- 5-b
SELECT * FROM Product
ORDER BY Price DESC

---------------------------------------------- 5-c
SELECT * FROM HangDetails
WHERE Ten_Hang = 'Asus'

---------------------------------------------- 5-d
SELECT * FROM Product
WHERE So_Luong_Hien_CO < '11'


---------------------------------------------- 5-e
SELECT * FROM Product
WHERE Ma_So_Hang = '123'

---------------------------------------------- 6-a
SELECT Count( DISTINCT Ma_So_Hang) AS So_hang_san_pham_hien_co FROM Product

---------------------------------------------- 6-b
SELECT Count( DISTINCT ProductID) AS So_mat_hang_san_pham_hien_co FROM Product

---------------------------------------------- 6-c
SELECT 
	hd.Ma_So_Hang,
	hd.Ten_Hang,
	COUNT(ProductID) AS So_loai_san_pham_moi_hang
FROM HangDetails AS hd
JOIN Product AS p ON p.Ma_So_Hang = hd.Ma_So_Hang
GROUP BY hd.Ma_So_Hang, hd.Ten_Hang


---------------------------------------------- 6-d
SELECT SUM(So_Luong_Hien_Co) AS Tong_So_Dau_San_Pham FROM Product;
