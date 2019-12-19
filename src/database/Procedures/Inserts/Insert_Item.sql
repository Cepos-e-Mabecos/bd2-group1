CREATE OR REPLACE PROCEDURE Insert_Item(arg_json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		INSERT INTO items (item_type_cod,designation,price) 
			SELECT item_type_cod,designation,price FROM json_populate_record(
				NULL::items,
				$1 
			);
END	
$$	