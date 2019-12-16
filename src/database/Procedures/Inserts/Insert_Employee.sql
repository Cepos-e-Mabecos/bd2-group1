CREATE OR REPLACE PROCEDURE Insert_Employee(json_data JSON)
LANGUAGE plpgsql
AS $$
DECLARE
	employee_temp VARCHAR;
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT employees.employee_cod,employees.first_name, employees.last_name FROM json_populate_record(
			NULL::employees,
			$1
		))
		
		SELECT source.employee_cod INTO employee_temp FROM source;
		
		IF(select exists(select 1 From employees where employees.employee_cod = employee_temp)) THEN
			RAISE 'There is already a employee created with that Cod!';
		ELSE
			INSERT INTO employees (employees.employee_cod,employees.first_name, employees.last_name) SELECT employees.employee_cod,employees.first_name, employees.last_name FROM json_populate_record(
				NULL::employees,
				$1 
			);
		END IF;
END	
$$	