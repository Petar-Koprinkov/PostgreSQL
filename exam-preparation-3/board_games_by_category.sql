SELECT
	bd.id,
	bd.name,
	bd.release_year,
	c.name
FROM
	categories AS c
JOIN
	board_games AS bd
ON
	c.id = bd.category_id
WHERE
	c.name IN ('Strategy Games', 'Wargames')
ORDER BY
	release_year DESC