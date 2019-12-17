CREATE OR REPLACE PROCEDURE Insert_Menu_Item(json_data JSON)
LANGUAGE plpgsql
AS $$
DECLARE
	menu_item_temp VARCHAR;
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT menu_cod,item_cod FROM json_populate_record(
			NULL::menu_items,
			$1
		))
		
		SELECT 
            source.menu_item_cod INTO menu_item_temp 
            
        FROM source;
		
		IF(select exists(select 1 From menu_items where menu_items.menu_item_cod = menu_item_temp)) THEN
			RAISE 'There is already a Menu_Item created with that Cod!';
		ELSE
			INSERT INTO menu_items (menu_item_cod,menu_item_type_cod,designation) SELECT menu_item_cod,menu_item_type_cod,designation FROM json_populate_record(
				NULL::menu_items,
				$1 
			);
		END IF;
END	
$$	