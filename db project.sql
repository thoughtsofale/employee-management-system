use employee_management_system;
-- SQL Script for Employee Management System

-- Creating tables

-- 1. Employee Table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Gender CHAR(1),
    DateOfBirth DATE,
    Address VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(50),
    HireDate DATE,
    JobTitle VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10,2),
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
   
);
SELECT * FROM Employee;

-- 2. Department Table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    ManagerID INT,
    Location VARCHAR(100)
);
select * from Department;
-- 3. Job Table
CREATE TABLE Job (
    JobID INT PRIMARY KEY,
    JobTitle VARCHAR(50),
    JobDescription TEXT,
    SalaryRangeMin DECIMAL(10,2),
    SalaryRangeMax DECIMAL(10,2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
SELECT * FROM Job;

-- 4. Attendance Table
CREATE TABLE Attendance (
    AttendanceID INT PRIMARY KEY,
    EmployeeID INT,
    Date DATE,
    CheckInTime TIME,
    CheckOutTime TIME,
    Status VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
SELECT * FROM Attendence;

-- 5. Payroll Table
CREATE TABLE Payroll (
    PayrollID INT PRIMARY KEY,
    EmployeeID INT,
    PayPeriodStart DATE,
    PayPeriodEnd DATE,
    BasicSalary DECIMAL(10,2),
    Bonuses DECIMAL(10,2),
    Deductions DECIMAL(10,2),
    NetSalary DECIMAL(10,2),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
SELECT * FROM Payroll;

-- 6. Performance Table
CREATE TABLE Performance (
    PerformanceID INT PRIMARY KEY,
    EmployeeID INT,
    ReviewDate DATE,
    Reviewer VARCHAR(50),
    PerformanceScore INT,
    Comments TEXT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
SELECT * FROM Performance;

-- 7. Leave Table
CREATE TABLE Leeave (
    LeaveID INT PRIMARY KEY,
    EmployeeID INT,
    LeaveType VARCHAR(20),
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(20),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
SELECT * FROM leeave;

-- 8. Training Table
CREATE TABLE Training (
    TrainingID INT PRIMARY KEY,
    TrainingName VARCHAR(50),
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    Trainer VARCHAR(50)
);
SELECT * FROM Training;

-- 9. Project Table
CREATE TABLE Project (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(50),
    Description TEXT,
    StartDate DATE,
    EndDate DATE,
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);
SELECT * FROM Project;

-- 10. Asset Table
CREATE TABLE Asset (
    AssetID INT PRIMARY KEY,
    AssetName VARCHAR(50),
    AssetType VARCHAR(50),
    PurchaseDate DATE,
    AssignedTo INT,
    FOREIGN KEY (AssignedTo) REFERENCES Employee(EmployeeID)
);
SELECT * FROM Asset;

-- 11. Shift Table
CREATE TABLE Shift (
    ShiftID INT PRIMARY KEY,
    ShiftName VARCHAR(50),
    StartTime TIME,
    EndTime TIME,
    AssignedEmployeeID INT,
    FOREIGN KEY (AssignedEmployeeID) REFERENCES Employee(EmployeeID)
);
SELECT * FROM Shift;

-- 12. EmployeeTraining Table (Link Table for Many-to-Many Relationship)
CREATE TABLE EmployeeTraining (
    EmployeeID INT,
    TrainingID INT,
    PRIMARY KEY (EmployeeID, TrainingID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (TrainingID) REFERENCES Training(TrainingID)
);
SELECT * FROM EmployeeTrainig;

-- Inserting Sample Data

-- Department Table
INSERT INTO Department VALUES
(1, 'HR', 101, 'Building A'),
(2, 'Finance', 102, 'Building B'),
(3, 'IT', 103, 'Building C'),
(4, 'Marketing', 104, 'Building D'),
(5, 'Operations', 105, 'Building E'),
(6, 'Sales', 106, 'Building F'),
(7, 'Customer Support', 107, 'Building G'),
(8, 'Research and Development', 108, 'Building H'),
(9, 'Legal', 109, 'Building I'),
(10, 'Procurement', 110, 'Building J'),
(11, 'Public Relations', 111, 'Building K'),
(12, 'Quality Assurance', 112, 'Building L'),
(13, 'Product Management', 113, 'Building M'),
(14, 'Design', 114, 'Building N'),
(15, 'Logistics', 115, 'Building O'),
(16, 'Training and Development', 116, 'Building P'),
(17, 'Business Development', 117, 'Building Q'),
(18, 'Compliance', 118, 'Building R'),
(19, 'Strategy', 119, 'Building S'),
(20, 'Innovation', 120, 'Building T');


-- Employee Table
INSERT INTO Employee VALUES
(1001, 'John', 'Doe', 'M', '1985-06-15', '123 Elm St', '1234567890', 'john.doe@example.com', '2020-01-10', 'Manager', 1, 75000.00),
(1002, 'Jane', 'Smith', 'F', '1990-09-20', '456 Oak St', '0987654321', 'jane.smith@example.com', '2021-03-22', 'Analyst', 2, 55000.00),
(1003, 'Alice', 'Brown', 'F', '1988-03-12', '789 Pine St', '1122334455', 'alice.brown@example.com', '2019-07-01', 'Developer', 3, 65000.00),
(1004, 'Bob', 'Johnson', 'M', '1975-11-05', '321 Maple St', '9988776655', 'bob.johnson@example.com', '2015-05-15', 'Engineer', 3, 70000.00),
(1005, 'Eve', 'Davis', 'F', '1993-02-25', '654 Birch St', '5544332211', 'eve.davis@example.com', '2022-11-10', 'Coordinator', 4, 48000.00),
(1006, 'Charlie', 'White', 'M', '1982-07-17', '101 Cedar St', '2233445566', 'charlie.white@example.com', '2018-04-20', 'Supervisor', 5, 62000.00),
(1007, 'Emily', 'Green', 'F', '1987-12-30', '202 Spruce St', '6677889900', 'emily.green@example.com', '2020-08-15', 'Manager', 2, 85000.00),
(1008, 'David', 'Black', 'M', '1992-11-10', '303 Fir St', '3344556677', 'david.black@example.com', '2021-09-01', 'Analyst', 1, 58000.00),
(1009, 'Sophia', 'Gray', 'F', '1994-05-22', '404 Birch St', '1122334455', 'sophia.gray@example.com', '2022-07-05', 'Developer', 3, 72000.00),
(1010, 'James', 'Blue', 'M', '1986-03-30', '505 Pine St', '6677889900', 'james.blue@example.com', '2020-02-18', 'Engineer', 4, 77000.00),
(1011, 'Olivia', 'Red', 'F', '1991-06-14', '606 Oak St', '9988776655', 'olivia.red@example.com', '2021-05-30', 'Coordinator', 5, 52000.00),
(1012, 'Daniel', 'Pink', 'M', '1989-10-07', '707 Maple St', '2233445566', 'daniel.pink@example.com', '2017-12-11', 'Supervisor', 2, 68000.00),
(1013, 'Megan', 'Yellow', 'F', '1995-03-19', '808 Cedar St', '4455667788', 'megan.yellow@example.com', '2022-01-22', 'Manager', 3, 79000.00),
(1014, 'Jack', 'Purple', 'M', '1984-09-03', '909 Fir St', '5566778899', 'jack.purple@example.com', '2019-06-12', 'Engineer', 4, 75000.00),
(1015, 'Ava', 'Brown', 'F', '1990-01-14', '101 Maple St', '2233446677', 'ava.brown@example.com', '2021-11-05', 'Developer', 3, 68000.00),
(1016, 'Ethan', 'Silver', 'M', '1983-12-25', '202 Cedar St', '3344557788', 'ethan.silver@example.com', '2020-06-25', 'Analyst', 1, 59000.00),
(1017, 'Isabella', 'Gold', 'F', '1992-04-17', '303 Oak St', '6677885599', 'isabella.gold@example.com', '2022-10-20', 'Supervisor', 5, 63000.00),
(1018, 'Liam', 'Platinum', 'M', '1986-07-28', '404 Pine St', '7788996677', 'liam.platinum@example.com', '2020-09-15', 'Manager', 2, 80000.00),
(1019, 'Zoe', 'Copper', 'F', '1988-02-05', '505 Birch St', '8899007788', 'zoe.copper@example.com', '2021-01-30', 'Coordinator', 4, 55000.00),
(1020, 'Lucas', 'Steel', 'M', '1994-11-18', '606 Maple St', '9900112233', 'lucas.steel@example.com', '2022-03-14', 'Supervisor', 5, 64000.00);


-- Job Table
INSERT INTO Job VALUES
(6, 'Supervisor', 'Supervises teams and ensures workflow efficiency.', 55000.00, 70000.00, 1),
(7, 'Team Lead', 'Leads small teams within departments.', 60000.00, 75000.00, 2),
(8, 'Consultant', 'Provides expert advice in specific fields.', 70000.00, 90000.00, 3),
(9, 'Architect', 'Designs the structure and layout of buildings or systems.', 75000.00, 95000.00, 3),
(10, 'Specialist', 'Provides expertise in a specific technical area.', 65000.00, 85000.00, 4),
(11, 'Director', 'Manages multiple teams or departments.', 80000.00, 100000.00, 2),
(12, 'Assistant Manager', 'Supports managers in overseeing team operations.', 50000.00, 65000.00, 1),
(13, 'HR Specialist', 'Manages employee relations and recruitment processes.', 55000.00, 70000.00, 4),
(14, 'Accountant', 'Prepares financial records and ensures accuracy.', 50000.00, 65000.00, 5),
(15, 'Marketing Specialist', 'Assists in the development of marketing strategies.', 45000.00, 60000.00, 2),
(16, 'Product Manager', 'Manages product development lifecycle.', 75000.00, 90000.00, 1),
(17, 'Quality Analyst', 'Ensures quality control of products and services.', 60000.00, 75000.00, 3),
(18, 'Sales Manager', 'Leads the sales team and develops strategies.', 65000.00, 85000.00, 2),
(19, 'Operations Manager', 'Manages daily operations and logistics.', 70000.00, 90000.00, 5),
(20, 'Customer Service Representative', 'Handles customer queries and complaints.', 40000.00, 50000.00, 4);

-- Attendance Table
INSERT INTO Attendance VALUES
(6, 1006, '2023-12-01', '08:30:00', '17:00:00', 'Present'),
(7, 1007, '2023-12-01', '09:00:00', '17:30:00', 'Present'),
(8, 1008, '2023-12-01', '09:00:00', '17:00:00', 'Present'),
(9, 1009, '2023-12-01', '09:05:00', '17:05:00', 'Present'),
(10, 1010, '2023-12-01', '09:30:00', '17:30:00', 'Present'),
(11, 1011, '2023-12-01', '09:00:00', '17:00:00', 'Present'),
(12, 1012, '2023-12-01', '09:15:00', '17:15:00', 'Present'),
(13, 1013, '2023-12-01', '09:00:00', '17:00:00', 'Present'),
(14, 1014, '2023-12-01', '09:10:00', '17:10:00', 'Present'),
(15, 1015, '2023-12-01', '09:00:00', '17:00:00', 'Present'),
(16, 1016, '2023-12-01', '09:15:00', '17:15:00', 'Present'),
(17, 1017, '2023-12-01', '09:00:00', '17:00:00', 'Present'),
(18, 1018, '2023-12-01', '09:30:00', '17:30:00', 'Present'),
(19, 1019, '2023-12-01', '09:10:00', '17:10:00', 'Present'),
(20, 1020, '2023-12-01', '09:20:00', '17:20:00', 'Present');

-- Payroll Table
INSERT INTO Payroll VALUES
(6, 1006, '2023-11-01', '2023-11-30', 62000.00, 3500.00, 1500.00, 63500.00),
(7, 1007, '2023-11-01', '2023-11-30', 65000.00, 4000.00, 1700.00, 67000.00),
(8, 1008, '2023-11-01', '2023-11-30', 60000.00, 3500.00, 1600.00, 61500.00),
(9, 1009, '2023-11-01', '2023-11-30', 68000.00, 4200.00, 1800.00, 70000.00),
(10, 1010, '2023-11-01', '2023-11-30', 73000.00, 4500.00, 2000.00, 74500.00),
(11, 1011, '2023-11-01', '2023-11-30', 52000.00, 3000.00, 1400.00, 53600.00),
(12, 1012, '2023-11-01', '2023-11-30', 60000.00, 3200.00, 1600.00, 61600.00),
(13, 1013, '2023-11-01', '2023-11-30', 75000.00, 4800.00, 2000.00, 77000.00),
(14, 1014, '2023-11-01', '2023-11-30', 73000.00, 4600.00, 1900.00, 74600.00),
(15, 1015, '2023-11-01', '2023-11-30', 65000.00, 3900.00, 1700.00, 66700.00),
(16, 1016, '2023-11-01', '2023-11-30', 62000.00, 3500.00, 1500.00, 63500.00),
(17, 1017, '2023-11-01', '2023-11-30', 69000.00, 4200.00, 1800.00, 71000.00),
(18, 1018, '2023-11-01', '2023-11-30', 74000.00, 4500.00, 2000.00, 75500.00),
(19, 1019, '2023-11-01', '2023-11-30', 65000.00, 3900.00, 1600.00, 66900.00),
(20, 1020, '2023-11-01', '2023-11-30', 62000.00, 3400.00, 1500.00, 63500.00);

-- Performance Table
INSERT INTO Performance VALUES
(1, 1001, '2023-12-01', 'HR Manager', 85, 'Consistent performance'),
(2, 1002, '2023-12-01', 'Finance Manager', 78, 'Good analytical skills'),
(3, 1003, '2023-12-01', 'IT Manager', 92, 'Outstanding development work'),
(4, 1004, '2023-12-01', 'Engineering Lead', 88, 'Excellent technical expertise'),
(5, 1005, '2023-12-01', 'Marketing Manager', 76, 'Improving organizational skills');

-- Leave Table
INSERT INTO Leeave VALUES
(6, 1006, 'Sick', '2023-12-10', '2023-12-12', 'Approved'),
(7, 1007, 'Vacation', '2023-11-15', '2023-11-20', 'Approved'),
(8, 1008, 'Emergency', '2023-12-05', '2023-12-07', 'Approved'),
(9, 1009, 'Sick', '2023-11-30', '2023-12-02', 'Pending'),
(10, 1010, 'Vacation', '2023-12-10', '2023-12-15', 'Approved'),
(11, 1011, 'Sick', '2023-12-01', '2023-12-03', 'Rejected'),
(12, 1012, 'Vacation', '2023-12-05', '2023-12-10', 'Approved'),
(13, 1013, 'Emergency', '2023-11-20', '2023-11-22', 'Pending'),
(14, 1014, 'Sick', '2023-12-01', '2023-12-03', 'Approved'),
(15, 1015, 'Vacation', '2023-12-05', '2023-12-10', 'Approved'),
(16, 1016, 'Sick', '2023-11-15', '2023-11-17', 'Pending'),
(17, 1017, 'Vacation', '2023-11-10', '2023-11-15', 'Approved'),
(18, 1018, 'Emergency', '2023-11-25', '2023-11-27', 'Approved'),
(19, 1019, 'Sick', '2023-12-10', '2023-12-12', 'Approved'),
(20, 1020, 'Vacation', '2023-12-05', '2023-12-10', 'Approved');

-- Training Table
INSERT INTO Training VALUES
(6, 'Project Management', 'Training on effective project management skills.', '2023-12-05', '2023-12-10', 'John Trainer'),
(7, 'Data Science', 'Workshop on data analysis and machine learning.', '2023-12-05', '2023-12-10', 'Sarah Trainer'),
(8, 'Communication Skills', 'Training on improving communication within teams.', '2023-12-10', '2023-12-12', 'Jake Trainer'),
(9, 'Customer Service Excellence', 'Workshop on enhancing customer service skills.', '2023-12-15', '2023-12-17', 'Nancy Trainer'),
(10, 'Conflict Resolution', 'Training on resolving workplace conflicts.', '2023-12-20', '2023-12-22', 'Lucy Trainer'),
(11, 'Sales Techniques', 'Training on effective sales strategies.', '2023-12-15', '2023-12-18', 'Mark Trainer'),
(12, 'IT Security', 'Training on best practices for IT security.', '2023-12-10', '2023-12-12', 'Tom Trainer'),
(13, 'Time Management', 'Seminar on time management for better productivity.', '2023-12-05', '2023-12-07', 'Peter Trainer'),
(14, 'Business Strategy', 'Workshop on creating long-term business strategies.', '2023-12-20', '2023-12-22', 'Chris Trainer'),
(15, 'Leadership Skills', 'Program on developing leadership qualities.', '2023-12-01', '2023-12-05', 'Sarah Trainer'),
(16, 'Marketing Analytics', 'Training on using data for marketing decision-making.', '2023-12-10', '2023-12-12', 'David Trainer'),
(17, 'HR Compliance', 'Seminar on HR rules and regulations.', '2023-12-15', '2023-12-17', 'Helen Trainer'),
(18, 'Negotiation Skills', 'Training on how to negotiate effectively in business.', '2023-12-05', '2023-12-07', 'Linda Trainer'),
(19, 'Digital Marketing', 'Workshop on online marketing techniques.', '2023-12-10', '2023-12-12', 'Eva Trainer'),
(20, 'Presentation Skills', 'Training to improve presentation skills for leadership.', '2023-12-15', '2023-12-17', 'Jack Trainer');


-- Asset Table
INSERT INTO Asset VALUES
(1, 'Laptop', 'Electronics', '2023-01-01', 1001),
(2, 'Smartphone', 'Electronics', '2023-02-15', 1002),
(3, 'Office Chair', 'Furniture', '2023-03-10', 1003),
(4, 'Desktop', 'Electronics', '2023-04-05', 1004),
(5, 'Printer', 'Electronics', '2023-05-20', 1005);

-- Shift Table
INSERT INTO Shift VALUES
(1, 'Morning Shift', '08:00:00', '16:00:00', 1001),
(2, 'Evening Shift', '16:00:00', '00:00:00', 1002),
(3, 'Night Shift', '00:00:00', '08:00:00', 1003),
(4, 'Morning Shift', '08:00:00', '16:00:00', 1004),
(5, 'Evening Shift', '16:00:00', '00:00:00', 1005);

-- EmployeeTraining Table

INSERT INTO Project VALUES
(100, 'New CRM System', 'Implement a new customer relationship management system.', '2023-11-01', '2024-01-31', 2),
(101, 'Employee Wellness Program', 'Create and implement a wellness program for employees.', '2023-11-15', '2024-03-31', 1),
(102, 'New Marketing Campaign', 'Develop and launch a new marketing campaign.', '2023-12-01', '2024-01-15', 5),
(103, 'Cloud Infrastructure', 'Move the company’s infrastructure to the cloud.', '2023-12-01', '2024-04-30', 3),
(104, 'Sales Expansion', 'Expand the sales operation into new markets.', '2023-12-01', '2024-06-30', 4),
(105, 'Website Optimization', 'Optimize the website for better user experience.', '2023-11-10', '2023-12-20', 2),
(106, 'Employee Development Program', 'Launch a company-wide employee development program.', '2023-12-01', '2024-03-31', 1),
(107, 'Product Development', 'Develop new products for the next season.', '2023-12-05', '2024-05-31', 5),
(108, 'Market Research', 'Conduct research on new market trends.', '2023-11-01', '2023-12-31', 3),
(109, 'Process Automation', 'Automate routine operational processes.', '2023-11-01', '2024-01-15', 2),
(110, 'Vendor Management', 'Streamline vendor relations and contracts.', '2023-12-01', '2024-02-28', 4),
(112, 'Leadership Program', 'Launch leadership development programs for managers.', '2023-12-01', '2024-01-31', 1),
(113, 'App Development', 'Develop a mobile application for company services.', '2023-12-15', '2024-04-30', 3),
(114, 'Training and Development', 'Enhance training programs for employee skill growth.', '2023-11-01', '2024-01-31', 5),
(115, 'Digital Transformation', 'Implement digital tools for business operations.', '2023-12-01', '2024-06-30', 2);


INSERT INTO Performance VALUES
(6, 1006, '2023-12-01', 'HR Specialist', 80, 'Great organizational skills'),
(7, 1007, '2023-12-01', 'Finance Specialist', 85, 'Strong financial acumen'),
(8, 1008, '2023-12-01', 'IT Specialist', 90, 'Exceptional technical knowledge'),
(9, 1009, '2023-12-01', 'Engineering Specialist', 87, 'Strong engineering design skills'),
(10, 1010, '2023-12-01', 'Marketing Specialist', 92, 'Creative marketing strategies'),
(11, 1011, '2023-12-01', 'Sales Manager', 78, 'Effective team leadership'),
(12, 1012, '2023-12-01', 'Operations Manager', 81, 'Strong operational insights'),
(13, 1013, '2023-12-01', 'HR Manager', 90, 'Great leadership abilities'),
(14, 1014, '2023-12-01', 'Product Manager', 88, 'Efficient product lifecycle management'),
(15, 1015, '2023-12-01', 'Customer Service Manager', 75, 'Good customer handling skills'),
(16, 1016, '2023-12-01', 'Accountant', 82, 'Strong attention to detail'),
(17, 1017, '2023-12-01', 'Consultant', 93, 'Highly valuable insights'),
(18, 1018, '2023-12-01', 'Team Lead', 85, 'Strong team coordination skills'),
(19, 1019, '2023-12-01', 'Project Manager', 88, 'Excellent project execution'),
(20, 1020, '2023-12-01', 'Product Specialist', 80, 'Innovative product ideas');

-- Queries to Demonstrate Functionalities
SHOW TABLES;

-- 1. Join Query: Retrieve Employees with Their Department Names
SELECT e.FirstName, e.LastName, d.DepartmentName
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID;

-- 2. Union Query: Combine Employees and Managers
SELECT FirstName, LastName, 'Employee' AS Role FROM Employee
UNION
SELECT FirstName, LastName, 'Manager' AS Role FROM Employee WHERE JobTitle = 'Manager';

-- 3. Normalization: Ensure Salary Range in Job Table Does Not Overlap
SELECT * FROM Job WHERE SalaryRangeMin < SalaryRangeMax;
-- More Queries Can Be Added...
-- 4. Retrieve Total Number of Employees by Department
SELECT d.DepartmentName, COUNT(e.EmployeeID) AS TotalEmployees
FROM Department d
LEFT JOIN Employee e ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

-- 5. Get Average Salary per Job Title
SELECT j.JobTitle, AVG(e.Salary) AS AverageSalary
FROM Job j
JOIN Employee e ON j.JobID = e.Salary
GROUP BY j.JobTitle;

-- 6. Find Employees who have taken Training
SELECT e.FirstName, e.LastName, t.TrainingName
FROM Employee e
JOIN EmployeeTraining et ON e.EmployeeID = et.EmployeeID
JOIN Training t ON et.TrainingID = t.TrainingID;

-- 7. Retrieve Employees with Performance Scores Above 85
SELECT e.FirstName, e.LastName, p.PerformanceScore
FROM Employee e
JOIN Performance p ON e.EmployeeID = p.EmployeeID
WHERE p.PerformanceScore > 85;

-- 8. List Employees on Leave with Leave Types
SELECT e.FirstName, e.LastName, l.LeaveType, l.StartDate, l.EndDate, l.Status
FROM Employee e
JOIN Leeave l ON e.EmployeeID = l.EmployeeID
WHERE l.Status = 'Approved';

-- 9. Calculate Total Bonuses Paid in Last Payroll Period
SELECT SUM(bonuses) AS TotalBonuses
FROM Payroll
WHERE PayPeriodStart >= '2023-11-01' AND PayPeriodEnd <= '2023-11-30';

-- 10. Retrieve Shift Details with Assigned Employees
SELECT s.ShiftName, COUNT(e.EmployeeID) AS AssignedEmployeeCount
FROM Shift s
LEFT JOIN Employee e ON s.AssignedEmployeeID = e.EmployeeID
GROUP BY s.ShiftName;

-- 11. Count Total Projects managed by Each Department
SELECT d.DepartmentName, COUNT(p.ProjectID) AS TotalProjects
FROM Department d
LEFT JOIN Project p ON d.DepartmentID = p.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName;

-- 12. Get Leave History for Employees
SELECT e.FirstName, e.LastName, l.LeaveType, l.StartDate, l.EndDate
FROM Employee e
JOIN Leeave l ON e.EmployeeID = l.EmployeeID
ORDER BY l.StartDate DESC;

-- 13. Find All Employees Who Have Not Received Training
SELECT e.FirstName, e.LastName
FROM Employee e
LEFT JOIN EmployeeTraining et ON e.EmployeeID = et.EmployeeID
WHERE et.TrainingID IS NULL;

-- 14. Get Employee Count Per Job Title
SELECT e.JobTitle, COUNT(e.EmployeeID) AS EmployeeCount
FROM Employee e
GROUP BY e.JobTitle;

-- 15. Retrieve Performance Review Comments for Specific Employees
SELECT e.FirstName, e.LastName, p.Comments
FROM Employee e
JOIN Performance p ON e.EmployeeID = p.EmployeeID
WHERE p.ReviewDate = '2023-12-01';

-- 16. Get Employees with New Hires in Last Year
SELECT e.FirstName, e.LastName, e.HireDate
FROM Employee e
WHERE e.HireDate >= DATEADD(YEAR, -1, GETDATE());

-- 17. List Projects with Start Dates in the Next Month
SELECT p.ProjectName, p.StartDate
FROM Project p
WHERE p.StartDate BETWEEN GETDATE() AND DATEADD(MONTH, 1, GETDATE());

-- 18. Find Salary Differences Between Job Titles
SELECT j.JobTitle, MAX(e.Salary) - MIN(e.Salary) AS SalaryDifference
FROM Job j
JOIN Employee e ON j.JobID = e.Salary
GROUP BY j.JobTitle;

-- 19. Average Performance Score by Department
SELECT d.DepartmentName, AVG(p.PerformanceScore) AS AverageScore
FROM Department d
JOIN Employee e ON d.DepartmentID = e.DepartmentID
JOIN Performance p ON e.EmployeeID = p.EmployeeID
GROUP BY d.DepartmentName;

-- 20. Get All Employees working in a Particular Location
SELECT e.FirstName, e.LastName, d.Location
FROM Employee e
JOIN Department d ON e.DepartmentID = d.DepartmentID
WHERE d.Location = 'Building A';
SELECT 
    Department.DepartmentID,
    Department.DepartmentName,
    Employee.EmployeeID,
    Employee.FirstName,
    Employee.LastName
FROM 
    Department
LEFT JOIN 
    Employee ON Department.DepartmentID = Employee.DepartmentID;
SELECT 
    Department.DepartmentID,
    Department.DepartmentName,
    Employee.EmployeeID,
    Employee.FirstName,
    Employee.LastName
FROM 
    Department
RIGHT JOIN 
    Employee ON Department.DepartmentID = Employee.DepartmentID;

