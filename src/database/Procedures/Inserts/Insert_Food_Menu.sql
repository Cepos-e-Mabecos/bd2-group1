CREATE OR REPLACE PROCEDURE Insert_Food_Menu(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Food_Menus
    INSERT INTO Food_Menus SELECT cod_food_menu_type,cod_restaurant,cod_date FROM json_populate_record(
        NULL::Food_Menus,
        $1 
    );

END
$$