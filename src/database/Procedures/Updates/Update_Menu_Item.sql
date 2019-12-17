CREATE OR REPLACE PROCEDURE Update_Menu_Item(temp_menu_cod BIGINT, temp_item_cod BIGINT, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    IF(select exists(select 1 From menu_items where Menu_menu_items.menu_cod = temp_menu_cod AND Menu_menu_items.menu_item_cod = temp_menu_item_cod)) THEN
        -- GET JSON DATA

        WITH source AS (SELECT menu_cod,item_cod FROM json_populate_record(
            NULL::menu_items,
            $2
        ))
        
        UPDATE menu_items SET 
            item_cod = s.item_cod,
            menu_cod = s.menu_cod
        FROM source as s
        WHERE 
            menu_items.menu_cod = temp_menu_cod
        AND
            menu_items.item_cod = temp_item_cod;
    ELSE
        RAISE 'There is no menu_item with that Cod!';
    END IF;
END