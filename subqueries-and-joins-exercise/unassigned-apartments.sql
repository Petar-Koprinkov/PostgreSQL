SELECT
	b.booking_id,
	b.apartment_id,
	companion_full_name
FROM
	bookings AS b
LEFT JOIN
	customers as c
USING
	(customer_id)
WHERE
	b.apartment_id IS NULL