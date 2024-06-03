SELECT
	name,
	SUM(b.booked_for)
FROM
	apartments AS a
JOIN
	bookings AS b
USING
	(apartment_id)
GROUP by
	a.name
ORDER BY
	name