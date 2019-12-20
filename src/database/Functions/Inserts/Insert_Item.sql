CREATE OR REPLACE FUNCTION Insert_Employee(json_data JSON)
RETURNS INTEGER AS $id$
DECLARE id INTEGER;
BEGIN
        INSERT INTO items (item_type_cod,designation,price) 
			SELECT item_type_cod,designation,price FROM json_populate_record(
				NULL::items,
				$1 
			) returning item_cod into id;
        RETURN id;
END
$id$ LANGUAGE plpgsql;