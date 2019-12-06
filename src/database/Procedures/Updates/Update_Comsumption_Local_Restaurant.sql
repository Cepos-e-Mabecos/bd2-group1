CREATE OR REPLACE PROCEDURE Update_Consumption_Locals_Restaurant(temp_cod_restaurant int, temp_cod_comsumption_local int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_restaurant,cod_comsumption_local FROM json_populate_record(
        NULL::Consumption_Locals_Restaurants,
        $2
    ))

    -- UPDATE TABLE ITENS_ALERGIAS
    UPDATE Consumption_Locals_Restaurants SET 
        cod_restaurant = s.cod_restaurant,
        cod_comsumption_local = s.cod_comsumption_local
    FROM source AS s
    WHERE 
        cod_restaurant = temp_cod_restaurant 
    AND
        cod_comsumption_local = temp_cod_comsumption_local;

END
$$