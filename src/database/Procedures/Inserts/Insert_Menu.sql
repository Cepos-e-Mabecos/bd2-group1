CREATE OR REPLACE PROCEDURE Insert_Menu(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		INSERT INTO menus (menu_type_cod,designation) SELECT menu_type_cod,designation FROM json_populate_record(
			NULL::menus,
			$1 
		);
END	
$$	