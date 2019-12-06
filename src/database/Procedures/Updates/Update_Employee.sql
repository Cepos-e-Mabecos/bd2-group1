CREATE OR REPLACE PROCEDURE Update_Employee(temp_cod_employee int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT first_name,last_name FROM json_populate_record(
        NULL::Employees,
        $2
    ))

    -- UPDATE TABLE EmployeeS
    UPDATE Employees SET 
        first_name = s.first_name,
        last_name = s.last_name
    FROM source AS s
    WHERE cod_employee = temp_cod_employee;

END
$$