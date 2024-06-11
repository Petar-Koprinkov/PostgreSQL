SELECT
	bg.name,
	bg.rating,
	c.name
FROM
	board_games AS bg
JOIN
	categories AS c
ON
	c.id = bg.category_id
JOIN
	players_ranges AS pr
ON
	pr.id = bg.players_range_id
WHERE 
	(rating > 7.00 AND bg.name ILIKE '%a%')
		OR 
	rating > 7.50
		AND
	(pr.max_players - pr.min_players) BETWEEN 2 AND 5
ORDER BY
	bg.name ASC,
	bg.rating DESC
LIMIT 5




