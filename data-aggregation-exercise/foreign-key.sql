CREATE TABLE employees_projects (
	id serial PRIMARY KEY,
	employee_id INT REFERENCES employees(id),
	project_id INT REFERENCES projects(id)
)
