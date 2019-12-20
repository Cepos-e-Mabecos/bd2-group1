CREATE OR REPLACE FUNCTION Insert_Menu(json_data JSON)
RETURNS INTEGER AS $id$
DECLARE id INTEGER;
BEGIN
        INSERT INTO menus (menu_type_cod,designation) 
			SELECT menu_type_cod,designation FROM json_populate_record(
				NULL::menus,
				$1 
		) returning menu_cod into id;
        RETURN id;
END
$id$ LANGUAGE plpgsql;