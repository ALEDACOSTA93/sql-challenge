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
WHERE hire_date = "1986";

--List the manager of each department

