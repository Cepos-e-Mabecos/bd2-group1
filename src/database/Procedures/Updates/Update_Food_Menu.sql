CREATE OR REPLACE PROCEDURE Update_Food_Menu(temp_cod_food_menu int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_food_menu_type,cod_restaurant,cod_date FROM json_populate_record(
        NULL::Food_Menus,
        $2
    ))

    -- UPDATE TABLE Food_Menus
    UPDATE Food_Menus SET 
        cod_food_menu_type = s.cod_food_menu_type,
        cod_restaurant = s.cod_restaurant,
        cod_date = s.cod_date
    FROM source AS s
    WHERE cod_food_menu = temp_cod_food_menu;

END
$$