CREATE OR REPLACE FUNCTION Select_Menu_Item(arg_menu_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From menu_items 
        where menu_items.menu_cod = arg_menu_cod)) THEN
		RETURN (
            Select json_build_object(
			    'Menu_Designation', menus.designation,
                'Menu_Items', (
                        select json_object_agg(
                            'Item', Items.designation)
                                FROM Items
                                    INNER JOIN Menu_Items
                                        ON Menu_Items.item_cod = Items.item_cod
                                            WHERE Menu_Items.menu_cod = arg_menu_cod
                        ))
                    FROM menu_items 
                        INNER JOIN Menus
                            ON menu_items.menu_cod = menus.menu_cod
                                WHERE menu_items.menu_cod = arg_menu_cod);
	ELSE
		RAISE 'There is no Menu_Items with the Menu Cod!';
	END IF;
END
$$