CREATE OR REPLACE FUNCTION fn_get_volunteers_count_from_department(searched_volunteers_department VARCHAR(30))
RETURNS INTEGER
AS
$$
	DECLARE
		count_of_volunteers INTEGER; 
	BEGIN
		SELECT 
			COUNT(*) INTO count_of_volunteers
		FROM
			volunteers_departments AS vd
		JOIN
			volunteers AS v
		ON
			vd.id = v.department_id
		WHERE
			department_name = searched_volunteers_department;

		RETURN count_of_volunteers;
	END;
$$
LANGUAGE plpgsql;