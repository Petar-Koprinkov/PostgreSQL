CREATE OR REPLACE FUNCTION fn_count_employees_by_town(town_name VARCHAR(20))
RETURNS INTEGER
AS
$$
	DECLARE
		count_employees INTEGER;
	BEGIN
		SELECT
			COUNT(*) INTO count_employees
		FROM
			employees AS e
		JOIN
			addresses AS a
		USING
			(address_id)
		JOIN
			towns AS t
		USING
			(town_id)
		WHERE
			t.name = town_name;
	RETURN count_employees;
	END;
$$
LANGUAGE plpgsql;
