CREATE OR REPLACE PROCEDURE Update_Comsumption(temp_cod_comsumption int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_client, cod_food_menu , cod_employee, comsumption_date FROM json_populate_record(
        NULL::Comsumptions,
        $2
    ))

    -- UPDATE TABLE Comsumptions
    UPDATE Comsumptions SET 
        cod_client = s.cod_client,
        cod_food_menu = s.cod_food_menu,
        cod_employee = s.cod_employee
        comsumption_date = s.comsumption_date
    FROM source AS s
    WHERE cod_comsumption = temp_cod_comsumption;

END
$$