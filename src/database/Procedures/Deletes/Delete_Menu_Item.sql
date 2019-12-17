CREATE OR REPLACE PROCEDURE Delete_Menu_Item(temp_menu_cod BIGINT, temp_item_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Menu_Items where 
            Menu_Items.menu_cod = temp_menu_cod
        AND
            Menu_Items.item_cod = temp_item_cod)) 
        THEN
		DELETE FROM Menu_Items
			WHERE 
                Menu_Items.menu_cod = temp_menu_cod
            AND
                Menu_Items.item_cod = temp_item_cod;
	ELSE
		RAISE 'There is no Menu_Item with that Menu and Item Cod!';
	END IF;
END
$$