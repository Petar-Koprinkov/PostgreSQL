CREATE TABLE search_results (
    id SERIAL PRIMARY KEY,
    address_name VARCHAR(50),
    full_name VARCHAR(100),
    level_of_bill VARCHAR(20),
    make VARCHAR(30),
    condition CHAR(1),
    category_name VARCHAR(50)
);

CREATE OR REPLACE PROCEDURE sp_courses_by_address(address_name VARCHAR(100))
AS
$$
	BEGIN
		TRUNCATE TABLE search_results;
		INSERT INTO
			search_results (address_name,  full_name, level_of_bill, make, condition, category_name)
		SELECT
			ad.name,
			cl.full_name,
			CASE
				WHEN co.bill <= 20 THEN 'Low'
				WHEN co.bill <= 30 THEN 'Medium'
				ELSE
					'High'
			END, 
			ca.make,
			ca.condition,
			cat.name
		FROM
			addresses AS ad
		JOIN
			courses AS co
		ON
			ad.id = co.from_address_id
		JOIN
			clients AS cl
		ON
			cl.id = co.client_id
		JOIN
			cars AS ca
		ON
			ca.id = co.car_id
		JOIN
			categories AS cat
		ON
			cat.id = ca.category_id
		WHERE
			ad.name = address_name
		ORDER BY
			ca.make,
			cl.full_name;
	END;
$$
LANGUAGE plpgsql;