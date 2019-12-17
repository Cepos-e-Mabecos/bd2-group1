CREATE OR REPLACE PROCEDURE Insert_Employee(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT first_name, last_name FROM json_populate_record(
			NULL::employees,
			$1
		))
		
		INSERT INTO employees (first_name, last_name) SELECT first_name, last_name FROM json_populate_record(
			NULL::employees,
			$1 
		);
END	
$$	