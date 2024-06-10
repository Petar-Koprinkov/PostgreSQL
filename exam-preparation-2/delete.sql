DELETE FROM
	clients
WHERE
	LENGTH(full_name) > 3 
		AND
	ID NOT IN (
		SELECT
			client_id
		FROM
			courses
	);

