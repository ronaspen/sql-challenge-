CREATE TABLE departments (
  dept_no VARCHAR NOT NULL,
  dept_name VARCHAR NOT NULL
);

CREATE TABLE dept_emp (
  emp_no INTEGER NOT NULL,
  dept_name VARCHAR NOT NULL
);


CREATE TABLE dept_manager (
  dept_no VARCHAR NOT NULL,
  emp_no INTEGER NOT NULL
);

CREATE TABLE employees (
	emp_no INTEGER NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE
);

SELECT
birth_date, 
TO_CHAR(birth_date, 'MM/DD/YYYY') 
FROM employees;

CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL
);

CREATE TABLE titles (
	title_id VARCHAR NOT NULL,
	title VARCHAR NOT NULL
);

DROP TABLE employees

show datestyle; 

ALTER DATABASE "sqlchallenge" SET datestyle TO "ISO, MDY";


SELECT employees.emp_no, employees.first_name, employees.last_name, employees.sex, salaries.salary
from employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

SELECT hire_date
FROM employees;


SELECT first_name, last_name, hire_date 
FROM employees
WHERE hire_date >= '1986-01-01' 
       and hire_date < '1987-01-01'
	   

--List the manager of each department along with their
--department number, department name, employee number, 
--last name, and first name.

SELECT dept_manager.dept_no, dept_manager.emp_no, employees.first_name, employees.last_name, departments.dept_name
from dept_manager
INNER JOIN employees ON
dept_manager.emp_no = employees.emp_no
INNER JOIN departments ON
dept_manager.dept_no = departments.dept_no


--made a mistake in creating table dept_emp. Changing name of column to 
--the correct name
ALTER TABLE dept_emp RENAME COLUMN dept_name TO dept_no;

--List the department number for each employee along with 
--that employee’s employee number, last name, first name,
--and department name.

SELECT employees.first_name, employees.last_name, employees.emp_no, dept_emp.dept_no, departments.dept_name
from employees
INNER JOIN dept_emp ON 
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no

--List the first name, last name, and sex of each employee whose first
--name is Hercules and whose last name begins with the letter B.

SELECT first_name, last_name, sex
FROM employees
where first_name = 'Hercules'
and last_name ILIKE 'B%';

--List each employee in the Sales department, including their
--employee number, last name, and first name.
SELECT employees.first_name, employees.last_name, employees.emp_no, dept_emp.dept_no, departments.dept_name
from employees
INNER JOIN dept_emp ON 
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, 
--and department name.
SELECT employees.first_name, employees.last_name, employees.emp_no, dept_emp.dept_no, departments.dept_name
from employees
INNER JOIN dept_emp ON 
employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON
dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development'

--List the frequency counts, in descending order, of all the employee
--last names (that is, how many employees share each last name).
SELECT last_name, COUNT(first_name)AS "Number of People"
FROM employees
GROUP BY last_name
ORDER BY "Number of People" DESC

