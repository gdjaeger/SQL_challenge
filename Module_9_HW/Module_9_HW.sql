-- departments.csv
CREATE TABLE departments (
  dept_no VARCHAR(4) PRIMARY KEY,
  dept_name VARCHAR(100)
);

-- dept_emp.csv
CREATE TABLE dept_emp (
  emp_no INT,
  dept_no VARCHAR(4)
);

-- dept_manager.csv
CREATE TABLE dept_manager (
  dept_no VARCHAR(4),
  emp_no INT
);

-- employees.csv
CREATE TABLE employees (
  emp_no INT PRIMARY KEY,
  emp_title_id VARCHAR(10),
  birth_date DATE,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  sex VARCHAR(1),
  hire_date DATE
);

-- salaries.csv
CREATE TABLE salaries (
  emp_no INT,
  salary INT
	
);

-- titles.csv
CREATE TABLE titles (
  title_id VARCHAR(10) PRIMARY KEY,
  title VARCHAR(100)
);

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01' AND hire_date < '1987-01-01';

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
JOIN employees e ON dm.emp_no = e.emp_no;

SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp de
JOIN employees e ON de.emp_no = e.emp_no
JOIN departments d ON de.dept_no = d.dept_no;

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;


