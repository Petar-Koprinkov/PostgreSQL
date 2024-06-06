CREATE OR REPLACE PROCEDURE sp_increase_salaries(department_name VARCHAR(50))
AS
$$
	BEGIN
		UPDATE
			employees
		SET
			salary = salary * 1.05
		WHERE
			(SELECT name FROM departments WHERE employees.department_id = departments.department_id) = department_name;
	END;
$$
LANGUAGE plpgsql;