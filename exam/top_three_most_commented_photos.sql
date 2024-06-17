SELECT
	p.id AS photo_id,
	P.capture_date,
	P.description,
	COUNT(c.id) AS comments_count
FROM
	photos AS p
JOIN
	comments AS c
ON
	p.id = c.photo_id
WHERE
	description IS NOT NULL
GROUP BY
	p.id,
	P.capture_date,
	P.description
ORDER BY
	COUNT(c.id) DESC,
	photo_id
LIMIT
	3;