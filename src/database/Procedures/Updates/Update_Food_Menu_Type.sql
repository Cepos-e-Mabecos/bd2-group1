CREATE OR REPLACE PROCEDURE Update_Food_Menu_Type(temp_cod_food_menu int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT designation FROM json_populate_record(
        NULL::Food_Menu_Types,
        $2
    ))

    -- UPDATE TABLE Food_Menu_Types
    UPDATE Food_Menu_Types SET 
        designation = s.designation
    FROM source AS s
    WHERE 
        cod_food_menu = temp_cod_food_menu;

END
$$