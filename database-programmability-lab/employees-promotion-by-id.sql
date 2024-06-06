CREATE OR REPLACE PROCEDURE sp_increase_salary_by_id(id INTEGER)
AS
$$
	BEGIN
		UPDATE
			employees
		SET
			salary = salary * 1.05
		WHERE
			employee_id = id;

		IF (SELECT employee_id FROM employees WHERE employee_id = id) IS NULL THEN
			ROLLBACK;
			RETURN;
		END IF;
	END;
$$
LANGUAGE plpgsql;

	




