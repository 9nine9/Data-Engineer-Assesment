#Data and Query Task (Basic)

/*
1. Create script to create table for each object
a. Employee
b. PositionHistory
*/
-- Create Employee table
CREATE TABLE IF NOT EXISTS Employee (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeId VARCHAR(10) UNIQUE,
    FullName VARCHAR(100) NOT NULL,
    BirthDate DATE NOT NULL,
    Address VARCHAR(500)
);

-- Create PositionHistory table
CREATE TABLE IF NOT EXISTS PositionHistory (
    Id INT PRIMARY KEY AUTO_INCREMENT,
    PosId VARCHAR(10),
    PosTitle VARCHAR(100) NOT NULL,
    EmployeeId VARCHAR(10) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(EmployeeId)
);

/*
2. Create insert script to inserting data into each table (Employee and PositionHistory)
*/
-- Insert data into Employee table
INSERT IGNORE INTO Employee (EmployeeId, FullName, BirthDate, Address)
VALUES
    ('10105001', 'Ali Anton', '1982-08-19', 'Jakarta Utara'),
    ('10105002', 'Rara Siva', '1982-01-01', 'Mandalika'),
    ('10105003', 'Rini Aini', '1982-02-20', 'Sumbawa Besar'),
    ('10105004', 'Budi', '1982-02-22', 'Mataram Kota');

-- Insert data into PositionHistory table
INSERT INTO PositionHistory (PosId, PosTitle, EmployeeId, StartDate, EndDate)
VALUES
    ('50000', 'IT Manager', '10105001', '2022-01-01', '2022-02-28'),
    ('50001', 'IT Sr. Manager', '10105001', '2022-03-01', '2022-12-31'),
    ('50002', 'Programmer Analyst', '10105002', '2022-01-01', '2022-02-28'),
    ('50003', 'Sr. Programmer Analyst', '10105002', '2022-03-01', '2022-12-31'),
    ('50004', 'IT Admin', '10105003', '2022-01-01', '2022-02-28'),
    ('50005', 'IT Secretary', '10105003', '2022-03-01', '2022-12-31');
    
    
/*
3. Create query to display all employee (EmployeeId, FullName, BirthDate, Address) data with their
current position information (PosId, PosTitle, EmployeeId, StartDate, EndDate)
*/
-- Display all employees with their current position information
SELECT E.EmployeeId, E.FullName, E.BirthDate, E.Address,
PH.PosId, PH.PosTitle, PH.StartDate, PH.EndDate
FROM Employee E 
JOIN PositionHistory PH ON E.EmployeeId = PH.EmployeeId;