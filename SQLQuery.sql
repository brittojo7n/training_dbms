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