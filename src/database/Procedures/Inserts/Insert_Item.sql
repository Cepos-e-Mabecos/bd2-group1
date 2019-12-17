CREATE OR REPLACE PROCEDURE Insert_Item(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT item_type_cod,designation,price FROM json_populate_record(
			NULL::items,
			$1
		))

		INSERT INTO items (item_type_cod,designation,price) SELECT item_type_cod,designation,price FROM json_populate_record(
			NULL::items,
			$1 
		);

END	
$$	