-- CREATE DATABASE == SCHEMA
CREATE DATABASE IF NOT EXISTS SALES;

USE SALES;

-- creating table
CREATE table sales
( 
	purchase_number INT NOT NULL PRIMARY KEY auto_increment,
    date_of_purchase DATE NOT NULL,
    customer_id INT,
    item_code VARCHAR(10) NOT NULL,
    FOREIGN KEY( customer_id ) REFERENCES customer(customer_id) ON DELETE CASCADE # THIS LAST PHRASE ALLOWS 
    # ON BOTH THE PARENT AND CHILD ACCT
);

CREATE table customers
( 
	
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email_address VARCHAR(255) UNIQUE KEY, 
    no_of_complaints INT
);

-- REMOVING CONSTRAINT UNIQUE 
ALTER TABLE customers
DROP INDEX email_address; #this drops the uniquess attribute of the column


-- CHANGING OR ADDING CONSTRAINT 
ALTER TABLE customers
CHANGE COLUMN no_of_complaints  no_of_complaints INT DEFAULT 0; #ALLOWS YOU CHANGE CONSTRAINTS OF A TABLE

-- REMOVING CONSTRAINT DEFAULT 
ALTER TABLE customers
ALTER COLUMN no_of_complaints DROP DEFAULT;

INSERT INTO customers ( first_name, last_name)
VALUES( 'Peter', 'Figaro' );


CREATE TABLE companies (
    company_id INT PRIMARY KEY AUTO_INCREMENT,
    company_name VARCHAR(255) NOT NULL,
    headquaters_no VARCHAR(255)
);
-- REMOVING NOT NULL CONSTRAINT
ALTER TABLE companies
modify company_name VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE company_name company_name VARCHAR(255) NOT NULL;

-- TESTING THE 
INSERT INTO companies (headquaters_no,company_name)
VALUES ('+1 (202) 555-0196', 'company a' );

SELECT * FROM SALES.customers;

-- DELETE STAEMENT

USE employees_mod;

COMMIT;

SELECT * FROM t_employees
WHERE emp_no = 10020;

DELETE FROM t_employees
WHERE emp_no = 10020;

ROLLBACK;

-- AGGREGATE FUNCTIONS

SELECT 
    *
FROM
    t_salaries
ORDER BY salary DESC
LIMIT 10;

SELECT 
    #count(salary)
    #count(from_date)
	#USING COUNT(*) #RETURN ALL ROWS INCLUDING NULL
    count(*)
FROM
    t_salaries;
    
    
