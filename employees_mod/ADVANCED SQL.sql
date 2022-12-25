/* local varialbles - can only be used within a block of code
    Session Variables: a session is a series of dialogue btw a computer and user
    */
    
    -- session variales are visible only to the session it was created for eg import table for
    -- example i cant select SELECT s_var_1 in another connection
    
    SET @s_var_1 = 3;
    
    SELECT @s_var_1;
    
    
    -- GLOBAL VARIABLES EG dictates amount of connection to a server, 2nd code
    -- wont allow me establish a new connection coz max_connection = 1
    
    SET GLOBAL max_connections = 1000;
    SET @@global.max_connections = 1;
    
    
-- INDEXES allows for faster process ie optimises query 
-- composite indexes are allowed
SELECT 
    *
FROM
    t_employees
WHERE
    hire_date > '2000-01-01';
    
    CREATE INDEX i_hire ON t_employees(hire_date);

-- CASES 
SELECT 
    dm.emp_no,
    e.first_name,
    e.last_name,
    MAX(s.salary) - MIN(s.salary) AS salary_difference,
CASE
    WHEN MAX(s.salary) - MIN(s.salary) > 30000 THEN ' SAL WAS RAISED BY 30K'
    WHEN MAX(s.salary) - MIN(s.salary) BETWEEN 20000 AND 30000 THEN 'SAL WAS RAISED BY 20K BUT LESS 30K'
    ELSE 'SAL WAS RAISED LESS THAN 20K'
END AS salary_increase
    
    FROM t_dept_manager dm 
    JOIN t_employees e ON dm.emp_no = e.emp_no 
    JOIN t_salaries s on s.emp_no = e.emp_no
    GROUP BY s.emp_no;
		
        
-- if cases can only allow for 1 conditional; expression
SELECT 
    emp_no,
    first_name,
    last_name,
	IF (gender = 'm', 'MALE', 'FEMALE') AS gender
FROM t_employees;


-- MORE CASES SAMPLE:
SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
CASE
	when dm.emp_no IS NOT NULL THEN 'MANAGER'
    ELSE 'EMPLOYEE'
END AS is_manager

FROM t_employees e
JOIN t_dept_manager dm ON e.emp_no = dm.emp_no

WHERE e.emp_no > 109990;


--
SELECT 
    emp_no,
    first_name,
    last_name,
CASE 
	WHEN gender = 'm' THEN 'MALE' 
    ELSE 'FEMALE'
END AS gender

FROM t_employees
    