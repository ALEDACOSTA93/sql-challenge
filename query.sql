--Query Tables
SELECT * FROM titles
SELECT * FROM employees
SELECT * FROM departments
SELECT * FROM dept_manager
SELECT * FROM dept_employees
SELECT * FROM salaries

--Join statement to query details of each employee
SELECT employees.emp_no, employees.last_name, employees.sex, employees.first_name, salaries.salary
FROM employees
JOIN salaries ON employees.emp_no=salaries.emp_no

--List fist name, last name, and hire date for employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE "1986-01-01" < hire_date AND hire_date < "1986-12-31";

--List the manager of each department with their dept number, dept name, employee number, last & first name
SELECT dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM employees
JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
JOIN departments ON dept_manager.dept_no=departments.dept_no

--List the department of each employee and their info
--Create View
CREATE VIEW employee_by_dept AS
SELECT employees.emp_no, employees.last_name, employees.first_name,departments.dept_name
FROM employees
JOIN dept_manager ON employees.emp_no=dept_manager.emp_no
JOIN departments ON dept_manager.dept_no=departments.dept_no

--Query View
SELECT emp_no, last_name, first_name, dept_name
FROM employee_by_dept

--List employess with name Hercules and last name B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name LIKE 'Hercules' AND last_name LIKE 'B%';

--List employees in Sales department
--Create View
CREATE VIEW employees_in_sales5 AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_employees ON departments.dept_no=dept_employees.dept_no
JOIN employees ON employees.emp_no=dept_employees.emp_no

--Query using view
SELECT emp_no, last_name, first_name, dept_name
FROM employees_in_sales5
WHERE dept_name = 'Sales'

--List employees in Sales & Development departments
--Create View
CREATE VIEW employees_in_sales_and_dev2 AS
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM departments
JOIN dept_employees ON departments.dept_no=dept_employees.dept_no
JOIN employees ON employees.emp_no=dept_employees.emp_no


--Query using view
SELECT emp_no, last_name, first_name, dept_name
FROM employees_in_sales_and_dev2
WHERE 
	dept_name = 'Sales' 
	OR dept_name = 'Development'
	
--List frequency count of employee last name in descending order
SELECT last_name, COUNT(*)
FROM employees
GROUP BY last_name
HAVING COUNT(*) > 1
