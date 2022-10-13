-- --------------------------- Deliverable 1 ---------------------------
-- List 1: retirement_titles
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ttl.title,
	ttl.from_date,
	ttl.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ttl
ON (e.emp_no = ttl.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- List 2: unique_titles
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date in ('9999-01-01')
ORDER BY rt.emp_no, rt.to_date DESC;

-- List 3: retiring_titles
SELECT COUNT(ut.emp_no),
	ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(ut.emp_no) DESC;

-- --------------------------- Deliverable 2 ---------------------------
-- List 1: The Employees Eligible for the Mentorship Program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ttl.title
INTO mentorship_eligibilty
FROM employees as e
INNER JOIN dept_employee as de
ON de.emp_no = e.emp_no
INNER JOIN titles as ttl
ON ttl.emp_no = e.emp_no
WHERE (de.to_date in ('9999-01-01') AND ttl.to_date in ('9999-01-01')) 
	   AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;








