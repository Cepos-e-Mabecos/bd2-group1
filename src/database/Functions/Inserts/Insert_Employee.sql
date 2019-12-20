CREATE OR REPLACE FUNCTION Insert_Employee(json_data JSON)
RETURNS INTEGER AS $id$
DECLARE id INTEGER;
BEGIN
        INSERT INTO employees (first_name, last_name) 
			SELECT first_name, last_name FROM json_populate_record(
				NULL::employees,
				$1 
			) returning employee_cod into id;
        RETURN id;
END
$id$ LANGUAGE plpgsql;