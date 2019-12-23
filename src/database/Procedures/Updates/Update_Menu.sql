CREATE OR REPLACE PROCEDURE Update_Menu(arg_menu_cod BIGINT, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

	IF(select exists(select 1 From menus where menus.menu_cod = arg_menu_cod)) THEN
		
		-- GET JSON DATA
		WITH source AS (SELECT menu_type_cod,designation FROM json_populate_record(
			NULL::menus,
			$2
		))

		UPDATE menus SET 
			menu_type_cod = s.menu_type_cod,
			designation = s.designation
		FROM source as s
		WHERE menus.menu_cod = arg_menu_cod;
	ELSE
		RAISE 'There is no Menu with the given Cod!';
	END IF;
END
$$