CREATE OR REPLACE PROCEDURE Insert_Food_Menu_Item(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Food_Menu_Items
    INSERT INTO Food_Menu_Items SELECT cod_item,cod_food_menu FROM json_populate_record(
        NULL::Food_Menu_Items,
        $1 
    );

END
$$