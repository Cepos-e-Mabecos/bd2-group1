CREATE OR REPLACE PROCEDURE Insert_Menu(json_data JSON)
LANGUAGE plpgsql
AS $$
DECLARE
	menu_temp VARCHAR;
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT menu_cod,menu_type_cod,designation FROM json_populate_record(
			NULL::menus,
			$1
		))
		
		SELECT source.menu_cod INTO menu_temp FROM source;
		
		IF(select exists(select 1 From menus where menus.menu_cod = menu_temp)) THEN
			RAISE 'There is already a Menu created with that Cod!';
		ELSE
			INSERT INTO menus (menu_cod,menu_type_cod,designation) SELECT menu_cod,menu_type_cod,designation FROM json_populate_record(
				NULL::menus,
				$1 
			);
		END IF;
END	
$$	