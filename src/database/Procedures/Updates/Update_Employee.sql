CREATE OR REPLACE PROCEDURE Update_Employee(temp_cod_employee BIGINT, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

	IF(select exists(select 1 From employees where employees.employee_cod = temp_cod_employee)) THEN
		-- GET JSON DATA
		WITH source AS (SELECT employee_cod,first_name, last_name FROM json_populate_record(
			NULL::employees,
			$2
		))
		
		UPDATE employees SET 
			employee_cod = s.employee_cod,
            first_name = s.first_name, 
            last_name = s.last_name
		FROM source as s
		WHERE employees.employee_cod = temp_cod_employee;
	ELSE
		RAISE 'There is no employee with that Cod!';
	END IF;
END
$$