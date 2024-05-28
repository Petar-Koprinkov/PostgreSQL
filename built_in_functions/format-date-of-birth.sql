SELECT
	last_name,
	TO_CHAR(born, 'DD (Dy) Mon YYYY')
FROM
	authors;