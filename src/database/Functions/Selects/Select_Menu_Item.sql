CREATE OR REPLACE FUNCTION Select_Menu_Item(temp_menu_cod BIGINT, temp_item_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From menu_items where 
        menu_items.menu_cod = temp_menu_cod and menu_items.item_cod = temp_item_cod)) THEN
		RETURN (Select json_build_object(
					'Menu_Designation', Menus.designation, 
					'Item_Designation', Items.designation)   
						FROM menu_items INNER JOIN Items
                            ON Menu_Items.item_cod = Items.item_cod
                        INNER JOIN Menus
                            ON Menu_Items.menu_cod = Menus.menu_cod);
	ELSE
		RAISE 'There is no Menu_Item with that Item_Cod and Menu_Cod!';
	END IF;
END
$$