-- CHECK --------------------------------------------------------------------------------------------------

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Salary DECIMAL(10, 2),
    -- Adding a "Check" constraint to ensure Salary is non-negative
    CONSTRAINT Salary_NonNegative CHECK (Salary >= 0)
);

-- Here's an example of inserting a valid record:
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES (1, 'John', 'Doe', 50000.00);

-- This will violate the "Check" constraint and result in an error.
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES (2, 'Jane', 'Smith', -2000.00);

-- Here's an example of inserting a valid record:
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES (1, 'John', 'Doe', 50000.00);

-- This will violate the "Check" constraint and result in an error.
INSERT INTO Employees (EmployeeID, FirstName, LastName, Salary)
VALUES (2, 'Jane', 'Smith', -2000.00);


-- PRIMARY KEY --------------------------------------------------------------------------------------------

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT
);

-- Valid insertions
INSERT INTO Students (StudentID, FirstName, LastName, Age)
VALUES (1, 'John', 'Doe', 20);

-- Invalid insertions (violates primary key constraint)
INSERT INTO Students (StudentID, FirstName, LastName, Age)
VALUES (NULL, 'Jane', 'Smith', 22);

INSERT INTO Students (StudentID, FirstName, LastName, Age)
VALUES (1, 'Sam', 'Johnson', 21);
-- Since 1 is already in use


-- SERIAL -------------------------------------------------------------------------------------------------

CREATE TABLE Employees (
    EmployeeID SERIAL PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT
);

-- Postgres will assign value automatically
INSERT INTO Employees (FirstName, LastName, Age)
VALUES (default, 'Jane', 'Smith', 25);


-- COMPOSITE PRIMARY KEY ----------------------------------------------------------------------------------

CREATE TABLE Orders (
    OrderID INT,
    ProductID INT,
    Quantity INT,
    OrderDate DATE,
    -- Creating a composite primary key using two columns
    CONSTRAINT PK_OaP PRIMARY KEY (OrderID, ProductID)
);

-- Valid insertions with unique combinations of OrderID and ProductID
INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate)
VALUES (1, 101, 5, '2023-01-15');

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate)
VALUES (1, 102, 3, '2023-01-15');

-- Invalid insertion (violates composite primary key constraint)
INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate)
VALUES (1, 101, 2, '2023-01-16');
-- Since this combination is already in use


-- NOT NULL -----------------------------------------------------------------------------------------------

CREATE TABLE Persons (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);


-- ALTERNATE KEY ------------------------------------------------------------------------------------------

CREATE TABLE app_credentials (
	employee_ID serial primary key,
	username varchar(100) NOT NULL,
	password varchar(100) NOT NULL,
	CONSTRAINT AK_password UNIQUE(password)
);


-- FOREIGN KEY --------------------------------------------------------------------------------------------

-- Creating the Customers table with a primary key
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100)
);

-- Creating the Orders table with a foreign key constraint
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    -- Creating a foreign key constraint that references the Customers table
    CONSTRAINT FK_Customer FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
