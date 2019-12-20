CREATE OR REPLACE PROCEDURE Delete_Menu_Item(arg_menu_cod BIGINT, arg_item_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF(select exists(
            select 1 From menu_items 
                where 
                    menu_items.menu_cod = arg_menu_cod
                AND
                    menu_items.item_cod = arg_item_cod)) THEN
		DELETE FROM menu_items
			WHERE 
                menu_items.item_cod = arg_item_cod
            AND
                menu_items.menu_cod = arg_menu_cod;
	ELSE
		RAISE 'There is no Menu_Item with the given Menu and Item Cod!';
	END IF;
END
$$