CREATE OR REPLACE FUNCTION Insert_Menu_Date(json_data JSON)
RETURNS INTEGER AS $id$
DECLARE id INTEGER;
BEGIN
        INSERT INTO Menu_Dates (menu_cod,designation,date_day) 
			SELECT menu_cod,designation,date_day FROM json_populate_record(
				NULL::Menu_Dates,
				$1 
		) returning date_cod into id;
        RETURN id;
END
$id$ LANGUAGE plpgsql;