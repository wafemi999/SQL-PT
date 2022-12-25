/* STORED ROUTINE ARE FIXED ACTIONS OR SET OF SQL STATEMENTS THAT 
CAN BE STORED ON THE DB SERVER BY CALL, REFERENCE OR INVOKE 

 STORED ROUTINE ARE OF 2 TYPES: STORED PRCEDURES AND FUNCTIONS */

USE employees_mod;

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
		SELECT * FROM t_employees
        LIMIT 1000;
END $$

DELIMITER ;

-- CALLING A PROCEDURE

CALL employees_mod.select_employees();

-- CALLING A PROCEDURE WITH ROUTINE

USE employees_mod;
DROP PROCEDURE IF exists emp_salary;

DELIMITER $$
USE employees_mod $$
CREATE PROCEDURE emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
    e.first_name, e.last_name, s.salary, s.from_date, s.to_date
FROM
    t_employees AS e
        JOIN
     t_salaries AS s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

END $$
DELIMITER ;



/* USING STORED PROCEDURES WITH AGGRGATE FUNCTIONS */
USE employees_mod;
DROP PROCEDURE IF exists avg_emp_salary;

DELIMITER $$
USE employees_mod $$
CREATE PROCEDURE avg_emp_salary(IN p_emp_no INTEGER)
BEGIN
SELECT 
    e.first_name, e.last_name, AVG(s.salary)
FROM
    t_employees AS e
        JOIN
     t_salaries AS s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

END $$
DELIMITER ;


/*STORED PROCEDURE WITH AN OUTPUT PARAMETER :
 WHEN USING THIS IT IS COMP TO USE THE SELECT-INTO STATEMENT*/
USE employees_mod;
DROP PROCEDURE IF exists avg_emp_salary_out;

DELIMITER $$
#USE employees_mod $$
CREATE PROCEDURE avg_emp_salary_out(IN p_emp_no INTEGER, OUT p_avg_salary DECIMAL(10,2))
BEGIN
SELECT 
    AVG(s.salary)
INTO p_avg_salary FROM
    t_employees AS e
        JOIN
    t_salaries AS s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;

END $$
DELIMITER ;

/*VARIABLES: MAKE USE OF THE OUT PROCEDURE ABOVE */
SET @V_avg_salary = 0; #SET THE VARIABLE WITH A values
CALL avg_emp_salary_out(10008,@V_avg_salary);  #CALL A PROCEDURE THAT USES THIS AS AN OUTPUT
SELECT @V_avg_salary;


-- /*FUNCTIONS*/
USE employees_mod;
DROP FUNCTION IF exists f_emp_avg_salary;

DELIMITER $$
CREATE FUNCTION f_emp_avg_salary(p_emp_no INTEGER) RETURNS DECIMAL(10,2)
BEGIN
DECLARE v_avg_salary DECIMAL(10,2);
SELECT 
    AVG(s.salary)
INTO v_avg_salary FROM
    t_employees AS e
        JOIN
    t_salaries AS s ON e.emp_no = s.emp_no
WHERE
    e.emp_no = p_emp_no;
RETURN v_avg_salary;
END$$
DELIMITER ;
SELECT f_emp_avg_salary(11300)
