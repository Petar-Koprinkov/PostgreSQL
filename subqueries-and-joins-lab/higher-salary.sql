SELECT
	COUNT(*)
FROM
	employees
WHERE
	salary > (
SELECT
	AVG(salary) AS avg_salary
FROM
	employees);