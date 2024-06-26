-- *******************************
-- Name: [Naiba Shabanova]
-- ID: [164598229]
-- Date: [13.02.2024]
-- Purpose: DBS211 Lab 04
-- *******************************
---I added questions here for you because of easy check)))

-- Q1 SOLUTION --
---Question--1.	Create a new empty table employee2 the same as table employees.  Use a single statement to create the table and insert the data at the same time.

CREATE TABLE employee2 AS SELECT * FROM
DBS211_EMPLOYEES WHERE 1=0;



-- Q2 SOLUTION --
--Question--2.	Modify table employee2 and add a new column username to this table. 
--The value of this column is not required and does not have to be unique

ALTER TABLE employee2 
ADD COLUMN username VARCHAR(255);


-- Q3 SOLUTION --
--Question--3.	Delete all the data in the employee2 table

DELETE FROM employee2;


-- Q4 SOLUTION --
--Question--4. Re-insert all data from the employees table into your new table employee2 using a single statement.
INSERT INTO employee2 (EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE, username)
SELECT EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE, NULL FROM DBS211_employees;
---I can also use * (all) 
--INSERT INTO employee2// same
--SELECT * FROM employees;

-- Q5 SOLUTION --
--Question --5	Create a statement that will insert yourself as an employee into employee2.  
/*a.	Use a unique employee number of your choice (Hint: Find the highest value of the employee number in the dbs211_employees table, increase the value by one and use it as your employee number.)
To find the highest value of the employee number you can sort the rows in the descending order. The first row will then contain the highest value.
Or, you can run the following statement (Do not include this statement in your submission.)

SELECT max(employeenumber)
FROM	dbs211_employees;

This statement returns the maximum value of the employee number in table dbs211_employees.

b.	Use your school email address
c.	Your extension is �x2222�
d.	Your job title will be �Cashier�
e.	Office code will be 4
f.	You will report to employee 1088
g.	You do not have any username*/


INSERT INTO employee2 (EMPLOYEENUMBER, LASTNAME, FIRSTNAME, EXTENSION, EMAIL, OFFICECODE, REPORTSTO, JOBTITLE, username)
VALUES (new_employee_number, 'Shabanova', 'Naiba', 'x2222', 'nshabanova@myseneca.ca', '4', 1088, 'Cashier', NULL);
--or 
/*INSERT INTO employee2 (employeenumber, email, extension, jobtitle, officecode, reportsto, username)
VALUES (your_chosen_employee_number, 'your_school_email_address', 'x2222', 'Cashier', 4, 1088, NULL);*/

--Q6 SOLUTION ---
--Question--6. Create a query that displays your, and only your, employee data.
SELECT * FROM employee2 WHERE employeenumber = your_chosen_employee_number;


--Q7 SOLUTION ---
--Question--7 	Create a statement to update your job title to �Head Cashier�.
/*Hint: Be careful. You may update other rows or all rows in the employee table. You only need to update one row which belongs to you and update your job title. Make sure that your query updates only one employee using a WHERE clause.*/
UPDATE employee2 SET jobtitle = 'Head Cashier' WHERE employeenumber = your_chosen_employee_number;


--Q8 SOLUTION ---
--Question--8	Create a statement to insert another fictional employee into employee2.  This employee will be a �Cashier� and will report to you.  Make up fake data for the other fields. The fake employee does not have any username.
INSERT INTO employee2 (employeenumber, email, extension, jobtitle, officecode, reportsto, username)
VALUES (fake_employee_number, 'fake_employee_email', 'fake_extension', 'Cashier', 4, your_chosen_employee_number, NULL);



--Q9 SOLUTION ---
--Question--9 9.	Create a statement to delete yourself from employee2.  Did it work?  If not, why?
//If the deletion operation failed, it could be attributed to the presence of foreign key constraints.
DELETE FROM employee2 WHERE employeenumber = your_chosen_employee_number;


--Q10 SOLUTION ---
--Question--10 Create a statement to delete the fake employee from employee2 and then rerun the statement to delete yourself.  Did it work? Explain why?
DELETE FROM employee2 WHERE employeenumber = fake_employee_number;
DELETE FROM employee2 WHERE employeenumber = your_chosen_employee_number;
//I think deleting  the fake employee initially can help circumvent any potential issues related to foreign key constraints.

--Q11 SOLUTION ---
--Question--11	Create a single statement that will insert both yourself and the fake employee at the same time.  This time you and the fake employee will report to 1088.

INSERT INTO employee2 (employeenumber, email, extension, jobtitle, officecode, reportsto, username)
VALUES 
(your_chosen_employee_number, 'your_school_email_address', 'x2222', 'Cashier', 4, 1088, NULL),
(fake_employee_number, 'fake_employee_email', 'fake_extension', 'Cashier', 4, 1088, NULL);


--Q12 SOLUTION ---
--Question--12 Create a single statement to delete both yourself and the fake employee from employee2.

DELETE FROM employee2 WHERE employeenumber IN (your_chosen_employee_number, fake_employee_number);

--Q13 SOLUTION ---
--Question--13.	In table employee2, generate the email address for column username for each student by concatenating the first character of employee�s first name and the employee�s last name. For instance, the username of employee Peter Stone will be pstone. NOTE: the username is in all lower case letters.  
UPDATE employee2 SET username = LOWER(SUBSTRING(firstname, 1, 1) || lastname);


--Q14 SOLUTION ---
--Question--14 In table employee2, remove all employees with office code 4. 
DELETE FROM employee2 WHERE officecode = 4

--Q15 SOLUTION ---
--Question--15	Drop table employee2.  
DROP TABLE employee2;
