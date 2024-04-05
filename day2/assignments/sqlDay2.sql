-- 1.   What is Views in MySql?  Why do we use Views? How to create views in MySql?

-- views are nothing virtual tables that are derived from the select query
-- view does not store data themselves  instead, they are a saved query that dynamically retrieves data from one or more underlying tables whenever the view is queried.
-- 	
-- we use view in order to:
-- Simplifying complex queries:Views allow you to encapsulate complex SQL logic into a single object, making it easier to write and understand queries.
-- Security:Views can restrict access to certain columns or rows of data, providing a layer of security by controlling the data that users can see.
-- Code reusability: Views can be reused across multiple queries or applications, reducing code duplication and improving maintainability.
-- Data abstraction:Views can hide the underlying complexity of the database schema by providing a simplified interface to users or applications.

-- syntax for creating view:
-- CREATE VIEW view_name AS
-- SELECT column1, column2, ...
-- FROM table_name
-- WHERE condition;

-- syntax to access the view : select * from view_name


-- 2.  Create a stored procedures that will display the employee details based on the given dept name.  Dept name is the input for stored procedure.  

use mysqlh2;
select * from emp;
select * from dept;

DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN dept_name VARCHAR(100))
BEGIN
    SELECT empno, ename, job, e.deptno
    FROM emp e
    INNER JOIN dept d ON e.deptno = d.deptno
    WHERE d.dname = dept_name;
END //

DELIMITER ;

CALL GetEmployeesByDepartment('Sales');

-- drop procedure GetEmployeesByDepartment;


-- 3. Create stored procedures that get employees count who are having greater salary than the average of all salaries.  Return employees count  as output variable.

DELIMITER //

CREATE PROCEDURE GetEmployeeCountAboveAverageSalary(OUT employee_count INT)
BEGIN
    DECLARE avg_salary DECIMAL(10, 2);

    -- Calculate the average salary
    SELECT AVG(sal) INTO avg_salary FROM emp;

    -- Get count of employees with salary greater than the average
    SELECT COUNT(*) INTO employee_count
    FROM emp
    WHERE sal > avg_salary;
END //

DELIMITER ;

CALL GetEmployeeCountAboveAverageSalary(@count);
SELECT @count AS employee_count;


-- 4. Create stored procedures that insert the data into emp table. Take all the required values as input parameters.  
DELIMITER //

CREATE PROCEDURE InsertIntoEmp(
    IN empno INT,
    IN ename VARCHAR(50),
    IN job VARCHAR(50),
    IN mgr INT,
    IN hiredate DATE,
    IN sal DECIMAL(10,2),
    IN comm DECIMAL(10,2),
    IN deptno INT
)
BEGIN
    INSERT INTO emp (empno, ename, job, mgr, hiredate, sal, comm, deptno)
    VALUES (empno, ename, job, mgr, hiredate, sal, comm, deptno);
END //

DELIMITER ;
CALL InsertIntoEmp(7369, 'SMITH', 'CLERK', 7902, '1980-12-17', 800.00, NULL, 20);



-- 5. Create View to return employee job and corresponding  max salary in each job.
CREATE VIEW MaxSalaryByJob AS
SELECT job, MAX(sal) AS max_salary
FROM emp
GROUP BY job;

SELECT * FROM MaxSalaryByJob;



-- 6.  How to use distinct option in select query? 
-- the DISTINCT keyword is used in the SELECT statement to remove duplicate rows from the result set. It ensures that only unique values are returned for the specified columns.

-- syntax:
-- SELECT DISTINCT column1, column2, ...
-- FROM table_name;

-- example:
-- select distinct(sal) from emp;
	
-- 7.   Create  ProductsLogs table to store the following information. 
-- 		 Eg:	  Id, Operation, ProductId, ProductName,  Date, Time,  Message 
-- 		
-- 		Hint: Target the Products table.

CREATE TABLE ProductsLogs (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Operation VARCHAR(50) NOT NULL,
    ProductId INT,
    ProductName VARCHAR(100),
    Date DATE,
    Time TIME,
    Message TEXT,
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);

-- 8.    Create  a AFTER INSERT trigger operation  and  insert the corresponding details ProductsLogs table. 

CREATE TRIGGER after_product_insert
AFTER INSERT ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductsLogs (Operation, ProductId, ProductName, Date, Time, Message)
    VALUES ('Insert', NEW.Id, NEW.ProductName, CURDATE(), CURTIME(), 'New product inserted');
END;


-- 9.  Create  a AFTER DELETE trigger operation  and  insert the corresponding details ProductsLogs table with corresponding message
CREATE TRIGGER after_product_delete
AFTER DELETE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO ProductsLogs (Operation, ProductId, ProductName, Date, Time, Message)
    VALUES ('Delete', OLD.Id, OLD.ProductName, CURDATE(), CURTIME(), 'Product deleted');
END;
