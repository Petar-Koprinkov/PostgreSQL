SELECT
	d.name AS distributor_name,
	i.name AS ingredient_name,
	p.name AS product_name, 
	AVG(f.rate) AS average_rate
FROM
	products AS p
JOIN
	products_ingredients AS pi
ON
	p.id = pi.product_id
JOIN
	ingredients AS i
ON
	i.id = pi.ingredient_id
JOIN
	distributors AS d
ON
	d.id = i.distributor_id
JOIN
	feedbacks AS f
ON
	f.product_id = p.id
GROUP BY
	distributor_name,
	ingredient_name,
	product_name
HAVING
	AVG(f.rate) BETWEEN 5 AND 8 
ORDER BY
	distributor_name,
	ingredient_name,
	product_name;