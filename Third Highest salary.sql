/*
Write an SQL query to retrieve the details of the employee with the 3rd highest salary in each department. 
If a department has fewer than 3 employees, return the details of the employee with the lowest salary in that department.
*/

USE practice;
CREATE TABLE Employee (
 emp_id INT NULL,
 emp_name VARCHAR(50) NULL,
 salary INT NULL,
 manager_id INT NULL,
 emp_age INT NULL,
 dep_id INT NULL,
 dep_name VARCHAR(20) NULL,
 gender VARCHAR(10) NULL
) ;

Insert INTO Employee 
VALUES (1,'Ankit',14300,4,39,100,'Analytics','Female'),
(2,'Mohit',14000,5,48,200,'IT','Male'),
(3,'Vikas',12100,4,37,100,'Analytics','Female'),
(4,'Rohit',7260,2,16,100,'Analytics','Female'),
(5,'Mudit',15000,6,55,200,'IT','Male'),
(6,'Agam',15600,2,14,200,'IT','Male'),
(7,'Sanjay',12000,2,13,200,'IT','Male'),
(8,'Ashish',7200,2,12,200,'IT','Male'),
(9,'Mukesh',7000,6,51,300,'HR','Male'),
(10,'Rakesh',8000,6,50,300,'HR','Male'),
(11,'Akhil',4000,1,31,500,'Ops','Male');

With cte AS (
	SELECT emp_id,emp_name,salary,dep_id,dep_name,
    RANK() OVER (PARTITION BY dep_id ORDER BY salary DESC ) as rnk,
    count(*) OVER (PARTITION BY dep_id) AS cnt
    FROM employee)

SELECT *
FROM cte
WHERE rnk = 3 OR (cnt<3 AND cnt = rnk);
    