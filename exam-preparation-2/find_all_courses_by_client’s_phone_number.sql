CREATE OR REPLACE FUNCTION fn_courses_by_client(phone_num VARCHAR(20)) 
RETURNS INTEGER
AS
$$	DECLARE
		result INTEGER;
	BEGIN
		SELECT
			COUNT(co.client_id) INTO result
		FROM
			clients AS cl
		JOIN
			courses AS co
		ON
			cl.id = co.client_id
		WHERE
			cl.phone_number = phone_num;
	RETURN result;
	END;
$$
LANGUAGE plpgsql;






