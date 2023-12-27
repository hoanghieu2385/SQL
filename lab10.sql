CREATE TABLE Employee(
	EmployeeID INT PRIMARY KEY ,
	Name VARCHAR(100),
	Tel CHAR(11),
	Email VARCHAR(30)
)


INSERT INTO Employee VALUES ('001', 'Hieu', '0123123', 'email-1@gmail.com')
INSERT INTO Employee VALUES ('002', 'Tung', '0123522', 'email-2@gmail.com')
INSERT INTO Employee VALUES ('003', 'Lam', '0123777', 'email-3@gmail.com')
INSERT INTO Employee VALUES ('004', 'Xuan', '0345893', 'email-4@gmail.com')
INSERT INTO Employee VALUES ('005', 'Mai', '0341193', 'email-5@gmail.com')
INSERT INTO Employee VALUES ('006', 'Phuc', '0885893', 'email-6@gmail.com')
INSERT INTO Employee VALUES ('007', 'Dung', '04535893', 'email-7@gmail.com')
INSERT INTO Employee VALUES ('008', 'Dang', '088453893', 'email-8@gmail.com')
INSERT INTO Employee VALUES ('009', 'Thang', '05454593', 'email-9@gmail.com')




SELECT * FROM Employee

DROP TABLE Employee

CREATE TABLE Project(
	ProjectID INT PRIMARY KEY ,
	ProjectName VARCHAR(30),
	StartDate DATETIME,
	EndDate DATETIME,
	Period INT,
	Cost MONEY
)

INSERT INTO Project VALUES ('01', 'Project 1', '2022-01-04', '2022-03-21', '2', '1000')
INSERT INTO Project VALUES ('02', 'Project 2', '2022-04-01', '2022-08-21', '4', '2000')
INSERT INTO Project VALUES ('03', 'Project 3', '2022-11-09', '2023-03-21', '5', '3000')
INSERT INTO Project VALUES ('04', 'Chính phủ điện tử', '2023-02-02', '2023-03-21', '1', '4000')
INSERT INTO Project VALUES ('05', 'Project 5', '2010-05-12', '2011-03-21', '10', '5000')




SELECT * FROM Project

DROP TABLE Project


CREATE TABLE Groups(
	GroupID INT PRIMARY KEY ,
	GroupName VARCHAR(30),
	LeaderID INT,
	ProjectID INT,
	FOREIGN KEY (ProjectID) REFERENCES Project(ProjectID) 
)

INSERT INTO Groups VALUES ('1', 'Group 1', '12', '01')
INSERT INTO Groups VALUES ('2', 'Group 2', '23', '02')
INSERT INTO Groups VALUES ('3', 'Group 3', '34', '03')
INSERT INTO Groups VALUES ('4', 'Group 4', '45', '04')
INSERT INTO Groups VALUES ('5', 'Group 4', '001', '04')
INSERT INTO Groups VALUES ('6', 'Group 6', '005', '05')
INSERT INTO Groups VALUES ('7', 'Group 7', '002', '05')
INSERT INTO Groups VALUES ('8', 'Group 8', '003', '02')




SELECT * FROM Groups

DROP TABLE Groups


CREATE TABLE GroupDetail(
	GroupID INT,
	EmployeeID INT,
	Status CHAR(20),
	PRIMARY KEY (GroupID, EmployeeID),
	FOREIGN KEY (GroupID) REFERENCES Groups(GroupID) ,
	FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) 
)

INSERT INTO GroupDetail VALUES ('1', '001', 'Finish')
INSERT INTO GroupDetail VALUES ('2', '002', 'Finish')
INSERT INTO GroupDetail VALUES ('3', '003', 'Finish')
INSERT INTO GroupDetail VALUES ('4', '004', 'Finish')
INSERT INTO GroupDetail VALUES ('4', '005', 'unfinished')
INSERT INTO GroupDetail VALUES ('4', '006', 'in process')
INSERT INTO GroupDetail VALUES ('5', '002', 'Finish')
INSERT INTO GroupDetail VALUES ('6', '001', 'in process')
INSERT INTO GroupDetail VALUES ('7', '003', 'Finish')



SELECT * FROM GroupDetail

DROP TABLE GroupDetail


-- Xoa bang
DROP TABLE GroupDetail
DROP TABLE Project
DROP TABLE Groups
DROP TABLE  Employee


-- Xem bang
SELECT * FROM Employee
SELECT * FROM Project
SELECT * FROM Groups
SELECT * FROM GroupDetail


----------------------------------------------- 3-a
SELECT * FROM Employee

----------------------------------------------- 3-b
SELECT Employee.*
FROM Employee
JOIN GroupDetail ON Employee.EmployeeID = GroupDetail.EmployeeID
JOIN Groups ON GroupDetail.GroupID = Groups.GroupID
JOIN Project ON Groups.ProjectID = Project.ProjectID
WHERE Project.ProjectName = 'Chính phủ điện tử'

----------------------------------------------- 3-c
SELECT Groups.GroupID, Groups.GroupName, Count(GroupDetail.EmployeeID) AS So_luong_nhan_vien_moi_nhom
FROM Groups
JOIN GroupDetail ON Groups.GroupID = GroupDetail.GroupID
GROUP BY Groups.GroupID, Groups.GroupName;

----------------------------------------------- 3-d
SELECT Employee.* FROM Employee
JOIN Groups ON Employee.EmployeeID = Groups.LeaderID

----------------------------------------------- 3-e
SELECT 
	G.GroupID,
	G.GroupName,
	GD.EmployeeID,
	E.Name,
	P.ProjectID,
	P.ProjectName,
	P.StartDate
FROM Groups G
JOIN
	GroupDetail GD ON G.GroupID = GD.GroupID
JOIN 
	Employee E ON GD.EmployeeID = E.EmployeeID
JOIN 
	Project P ON G.ProjectID = P.ProjectID

WHERE StartDate < '2010-10-20'

----------------------------------------------- 3-f
SELECT * FROM Employee E
LEFT JOIN GroupDetail GD ON E.EmployeeID = GD.EmployeeID
WHERE GD.EmployeeID IS NULL

----------------------------------------------- 3-g
SELECT Employee.*, Groups.*, Project.*  FROM Employee 
JOIN GroupDetail ON Employee.EmployeeID = GroupDetail.EmployeeID
JOIN Groups ON GroupDetail.GroupID = Groups.GroupID
JOIN Project ON Groups.ProjectID = Project.ProjectID
WHERE GroupDetail.Status = 'Finish';

----------------------------------------------- 4-a
ALTER TABLE Employee
ALTER COLUMN Name VARCHAR(100) NOT NULL;

----------------------------------------------- 4-b
SELECT * FROM Project
WHERE Cost > 1000