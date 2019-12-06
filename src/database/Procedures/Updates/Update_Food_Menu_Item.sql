CREATE OR REPLACE PROCEDURE Update_Food_Menu_Item(temp_cod_item int, temp_cod_food_menu int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_item,cod_food_menu FROM json_populate_record(
        NULL::Food_Menu_Items,
        $2
    ))

    -- UPDATE TABLE ITENS_ALERGIAS
    UPDATE Food_Menu_Items SET 
        cod_item = s.cod_item,
        cod_food_menu = s.cod_food_menu
    FROM source AS s
    WHERE 
        cod_item = temp_cod_item 
    AND
        cod_food_menu = temp_cod_food_menu;

END
$$