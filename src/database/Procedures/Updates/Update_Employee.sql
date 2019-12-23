CREATE OR REPLACE PROCEDURE Update_Employee(arg_employee_cod BIGINT, arg_json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

	IF(select exists(select 1 From employees where employees.employee_cod = arg_employee_cod)) THEN
		-- GET JSON DATA
		WITH source AS (SELECT first_name,last_name FROM json_populate_record(
			NULL::employees,
			$2
		))

		UPDATE employees SET 
            first_name = json_data.first_name, 
            last_name = json_data.last_name
		FROM source as json_data
		WHERE employees.employee_cod = arg_employee_cod;
	ELSE
		RAISE 'There is no Employee with the given Cod!';
	END IF;
END
$$