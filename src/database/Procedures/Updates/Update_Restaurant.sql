CREATE OR REPLACE PROCEDURE Update_Restaurant(temp_cod_restaurant int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_local,designation FROM json_populate_record(
        NULL::Restaurants,
        $2
    ))

    -- UPDATE TABLE Restaurants
    UPDATE Restaurants SET 
        cod_local = s.cod_local,
        designation = s.designation
    FROM source AS s
    WHERE cod_restaurant = temp_cod_restaurant;

END
$$