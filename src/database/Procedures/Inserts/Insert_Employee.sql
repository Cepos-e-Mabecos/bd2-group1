CREATE OR REPLACE PROCEDURE Insert_Employee(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT employees.first_name, employees.last_name FROM json_populate_record(
			NULL::employees,
			$1
		))
		
		INSERT INTO employees (employees.first_name, employees.last_name) SELECT employees.first_name, employees.last_name FROM json_populate_record(
			NULL::employees,
			$1 
		);
END	
$$	