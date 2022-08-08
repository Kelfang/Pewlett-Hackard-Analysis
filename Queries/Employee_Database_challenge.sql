-- RETRIEVE THE FOLLOWING FROM EMPLOYEES TABLE: EMP NO, FIRST NAME, LAST NAME.
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retire_list
FROM employees AS e
INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- USE DISTINCT WITH ORDERBY TO REMOVE DUPLICATE ROWS.
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retire_list
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, to_date DESC;

-- CONFIRM DATA
SELECT * FROM retire_list;

-- RETRIEVE # OF EMPLOYEES BY MOST RECENT JOB TITLE ABOUT TO RETIRE.
SELECT COUNT (emp_no), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY count DESC;

-- CONFIRM DATA
SELECT * FROM retiring_titles;

-- CREATE A MENTORSHIP ELIGIBILITY TABLE HOLDING EMPLOYEES ELIGIBLE TO PARTICIPATE.
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY emp_no;

-- CONFIRM DATA
SELECT * FROM mentorship_eligibility;

-- DETERMINE MENTORSHIP COUNTS BY TITLE FOR COMPARISION TO RETIRE EMPLOYEE COUNT. 
SELECT COUNT (emp_no), title
--INTO mentorship_elig_count
FROM mentorship_eligibility
GROUP BY title
ORDER BY count DESC;

-- EXPANDING BIRTHDATES ON MENTORSHIP ELIGIBILITY.
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility_expd
FROM employees AS e
INNER JOIN dept_emp AS de
	ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
	ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
	AND (e.birth_date BETWEEN '1963-01-01' AND '1966-12-31')
ORDER BY emp_no;

-- DETERMINE MENTORSHIP COUNTS (WITH EXPANDED BIRTHDATES) BY TITLE. 
SELECT COUNT (emp_no), title
INTO mentorship_elig_count_expd
FROM mentorship_eligibility_expd
GROUP BY title
ORDER BY count DESC;
