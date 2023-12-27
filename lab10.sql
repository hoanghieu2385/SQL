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


SELECT * FROM GroupDetail

DROP TABLE GroupDetail


DROP Employee, Groups, Project, GroupDetail

SELECT * FROM Employee
SELECT * FROM Project
SELECT * FROM Groups
SELECT * FROM GroupDetail


----------------------------------------------- 3-a
SELECT * FROM Employee

----------------------------------------------- 3-b
SELECT * FROM Employee IN 
WHERE GroupID = '4'


----------------------------------------------- 3-c




----------------------------------------------- 3-d




----------------------------------------------- 3-e




----------------------------------------------- 3-f




----------------------------------------------- 3-g



----------------------------------------------- 3-h


