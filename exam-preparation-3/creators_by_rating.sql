SELECT
	c.last_name,
	CEILING(AVG(bg.rating)) AS average_rating,
	p.name
FROM
	creators AS c
JOIN
	creators_board_games AS cbg
ON
	c.id = cbg.creator_id
JOIN
	board_games AS bg
ON
	bg.id = cbg.board_game_id
JOIN
	publishers AS p
ON
	p.id = bg.publisher_id
GROUP BY
	c.last_name,
	p.name
HAVING
	p.name = 'Stonemaier Games'
ORDER BY
	average_rating DESC