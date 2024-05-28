SELECT
	first_name,
	last_name,
	TO_CHAR(born, 'YYYY')
FROM
	authors