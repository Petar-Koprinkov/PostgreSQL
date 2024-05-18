SELECT
	name,
	start_date
FROM
	projects
WHERE
	LIKE(name, 'MOUNT%')
ORDER BY
	id