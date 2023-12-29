
CREATE TABLE Department (
	DepartId INT PRIMARY KEY,
	DepartName VARCHAR(50) NOT NULL,
	Departion VARCHAR(100) NOT NULL,
)

INSERT INTO Department VALUES ('1', 'DepartName 1', 'Description 1');
INSERT INTO Department VALUES ('2', 'DepartName 2', 'Description 2');
INSERT INTO Department VALUES ('3', 'DepartName 3', 'Description 3');


SELECT * FROM Department

DROP TABLE Department


CREATE TABLE Employee (
	EmpCode CHAR(6) PRIMARY KEY,
	FirstName VARCHAR(30) NOT NULL,
	LastName VARCHAR(30) NOT NULL,
	Birthday smalldatetime NOT NULL,
	Gender BIT DEFAULT 1,
	Address VARCHAR(100),
	DepartID INT,
	Salary MONEY,
	FOREIGN KEY (DepartID) REFERENCES Department(DepartID) 
)

INSERT INTO Employee VALUES ('001', 'FirstName 1', 'Last Name 1', '1991-05-01', '1', 'Address 1', '1', '1000');
INSERT INTO Employee VALUES ('002', 'FirstName 2', 'Last Name 2', '1996-02-11', '1', 'Address 2', '2', '2000');
INSERT INTO Employee VALUES ('003', 'FirstName 3', 'Last Name 3', '1998-02-28', '0', 'Address 3', '2', '3000');
INSERT INTO Employee VALUES ('004', 'FirstName 4', 'Last Name 4', '1995-12-21', '1', 'Address 4', '3', '4000');
INSERT INTO Employee VALUES ('005', 'FirstName 5', 'Last Name 5', '2000-06-01', '0', 'Address 5', '1', '5000');




SELECT * FROM Employee

DROP TABLE Employee


-- Xoa bang
DROP TABLE Department
DROP TABLE Employee

-- Hien Thi
SELECT * FROM Department
SELECT * FROM Employee


-------------------- 4 --------------------
Update Employee
SET Salary = Salary * 1.1
SELECT * FROM Employee

-------------------- 5 --------------------
ALTER TABLE Employee
ADD CONSTRAINT CheckSalary Check (Salary > 0)

