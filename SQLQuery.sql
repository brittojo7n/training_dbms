CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE
);



INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, HireDate) VALUES
(1, 'John', 'Doe', 'HR', 60000.00, '2022-01-15'),
(2, 'Jane', 'Smith', 'IT', 80000.00, '2021-06-01'),
(3, 'Peter', 'Jones', 'IT', 85000.00, '2023-03-10'),
(4, 'Mary', 'Williams', 'HR', 62000.00, '2023-08-20');



CREATE PROCEDURE spGetEmployeesByDepartment
    @DeptName NVARCHAR(50)
AS
BEGIN
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        Salary
    FROM
        Employees
    WHERE
        Department = @DeptName;
END;

EXEC spGetEmployeesByDepartment @DeptName = 'IT';



CREATE FUNCTION fnGetTotalSalaryByDepartment
(
    @DeptName NVARCHAR(50)
)
RETURNS DECIMAL(12, 2)
AS
BEGIN
    RETURN(
        SELECT
            SUM(Salary)
        FROM
            Employees
        WHERE
            Department = @DeptName
    );
END;

SELECT dbo.fnGetTotalSalaryByDepartment('HR') AS TotalHRSalary;



CREATE FUNCTION fnGetEmployeesByHireDate
(
    @StartDate DATE
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        EmployeeID,
        FirstName,
        LastName,
        Department,
        HireDate
    FROM
        Employees
    WHERE
        HireDate = @StartDate
);

SELECT * FROM dbo.fnGetEmployeesByHireDate('2022-01-15');



ALTER TABLE Employees
ADD IsActive BIT DEFAULT 1;



UPDATE Employees SET IsActive = 1;



CREATE PROCEDURE spDeactivateEmployee
    @EmployeeID INT
AS
BEGIN
    UPDATE Employees
    SET IsActive = 0 
    WHERE EmployeeID = @EmployeeID;
END;

EXEC spDeactivateEmployee @EmployeeID = 1;

SELECT * FROM Employees WHERE EmployeeID = 1;

SELECT * FROM Employees;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50),
    Location NVARCHAR(50)
);

ALTER TABLE Employees ADD DepartmentID INT;

INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(10, 'Human Resources', 'New York'),
(20, 'IT', 'Chicago'),
(30, 'Sales', 'New York');

INSERT INTO Employees (EmployeeID,FirstName, LastName, Salary, DepartmentID) VALUES
(5, 'John', 'Doe', 60000.00, 10),
(6, 'Jane', 'Smith', 85000.00, 20),
(7, 'Peter', 'Jones', 95000.00, 20),
(8, 'Mary', 'Williams', 72000.00, 30);

CREATE FUNCTION fnGetEmployeesByLocation
(
    @Location NVARCHAR(50)
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        E.EmployeeID,
        E.FirstName + ' ' + E.LastName AS FullName,
        D.DepartmentName,
        E.Salary,
        D.Location
    FROM
        Employees AS E
    JOIN 
        Departments AS D ON E.DepartmentID = D.DepartmentID
    WHERE
        D.Location = @Location
);

SELECT * FROM dbo.fnGetEmployeesByLocation('Chicago');