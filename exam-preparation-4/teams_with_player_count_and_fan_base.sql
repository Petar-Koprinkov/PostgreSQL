SELECT
	t.id,
	t.name AS team_name,
	COUNT(p.id) AS player_count,
	t.fan_base
FROM
	teams AS t
FULL JOIN
	players AS p
ON
	t.id = p.team_id
GROUP BY
	t.name,
	t.fan_base,
	t.id
HAVING
	t.fan_base > 30000
ORDER BY
	player_count DESC,
	fan_base DESC
	
	