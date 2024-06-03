SELECT
	MIN(avg_area_in_sq_km) AS min_average_area
FROM (SELECT
	AVG(area_in_sq_km) AS avg_area_in_sq_km
FROM
	countries
GROUP BY
	continent_code) AS table_avg_area_in_sq_km;