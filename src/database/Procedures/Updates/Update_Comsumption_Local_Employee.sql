CREATE OR REPLACE PROCEDURE Update_Comsumption_Locals_Employee(temp_cod_employee int, temp_cod_comsumption_local int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT comsumption_locals_employee_date FROM json_populate_record(
        NULL::Comsumption_Locals_Employees,
        $2
    ))

    -- UPDATE TABLE ITENS_ALERGIAS
    UPDATE Comsumption_Locals_Employees SET 
        comsumption_locals_employee_date = s.comsumption_locals_employee_date
    FROM source AS s
    WHERE 
        cod_employee = temp_cod_employee 
    AND
        cod_comsumption_local = temp_cod_comsumption_local;

END
$$