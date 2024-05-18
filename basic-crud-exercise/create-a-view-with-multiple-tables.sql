CREATE VIEW view_addresses
AS SELECT
	CONCAT_WS(' ',
		e.first_name,
		e.last_name) as full_name,
	e.department_id,
	CONCAT_WS(' ',
		a.number,
		a.street) as address
FROM
	employees as e,
	addresses as a
WHERE
	e.address_id = a.id