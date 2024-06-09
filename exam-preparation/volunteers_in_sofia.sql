SELECT
	v.name,
	v.phone_number,
	TRIM(v.address, 'Sofia , ') AS address
FROM
	volunteers AS v
JOIN
	volunteers_departments AS vd
ON
	vd.id = v.department_id
WHERE
	address LIKE '%Sofia%'
		AND
	vd.department_name = 'Education program assistant' 
ORDER BY
	v.name