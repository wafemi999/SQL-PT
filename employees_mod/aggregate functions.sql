SELECT 
    SUM(salary)
FROM
    t_salaries;
    
-- MIN AND MAX
SELECT 
    MIN(salary), MAX(salary)
FROM
    t_salaries;
    
    
-- AVG
SELECT 
    AVG(salary)
FROM
    t_salaries;
    
-- ROUND()
SELECT 
    ROUND(AVG(salary),2)
FROM
    t_salaries;
    
-- IF NULL AND COALESCE
SELECT 
    dept_no, IFNULL(dept_name, 'DEPT NOT PROVIDED') AS DeptName
FROM
    t_departments;
    
-- COALESCE WORKS WITH IFNULL FOR 2 ARGUMENTS
SELECT 
    dept_no, coalesce(dept_name, 'DEPT NOT PROVIDED') AS DeptName
FROM
    t_departments;
    
-- COALESCE WORKS WITH IFNULL FOR 3 OR  ARGUMENTS
SELECT 
    dept_no, 
    dept_name,
    coalesce(dept_no,dept_name, 'N/A') AS DeptManager
FROM
    t_departments;
-- using COALESSCE TO CREATE FAKE COLUMN    
SELECT 
    dept_no, 
    dept_name,
    coalesce( 'N/A') AS fakeColumn
FROM
    t_departments;
    
-- VIEWS
/* A VIRTUAL TABLE WHOSE CONTENTS ARE OBTAINED FROM AN EXISTING TABLES */
SELECT 
    *
FROM
    t_dept_emp;
 
-- 
SELECT 
    emp_no, from_date, to_date, COUNT(emp_no) AS Num
FROM
    t_dept_emp
GROUP BY emp_no
HAVING Num > 1
ORDER BY emp_no;

-- CREATE OR REPLACE VIEW
CREATE OR REPLACE VIEW V_dept_emp_latest_date AS 
SELECT 
    emp_no, MAX(from_date), MAX(to_date)
FROM
    t_dept_emp
GROUP BY emp_no;


