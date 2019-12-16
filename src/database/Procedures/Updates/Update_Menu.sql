CREATE OR REPLACE PROCEDURE Update_Menu(temp_cod_menu VARCHAR, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

	IF(select exists(select 1 From menus where menus.menu_cod = temp_cod_menu)) THEN
		-- GET JSON DATA
		WITH source AS (SELECT menu_cod,menu_type_cod,designation FROM json_populate_record(
			NULL::menus,
			$2
		))
		
		UPDATE menus SET 
			menu_type_cod = s.menu_type_cod,
			designation = s.designation
		FROM source as s
		WHERE menus.menu_cod = temp_cod_menu;
	ELSE
		RAISE 'There is no Menu with that Cod!';
	END IF;
END
$$