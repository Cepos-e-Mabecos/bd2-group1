CREATE OR REPLACE PROCEDURE Insert_Item(json_data JSON)
LANGUAGE plpgsql
AS $$
DECLARE
	item_temp VARCHAR;
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT item_cod,item_type_cod,designation,price FROM json_populate_record(
			NULL::items,
			$1
		))
		
		SELECT source.item_cod INTO item_temp FROM source;
		
		IF(select exists(select 1 From items where items.item_cod = item_temp)) THEN
			RAISE 'There is already a Item created with that Cod!';
		ELSE
			INSERT INTO items (item_cod,item_type_cod,designation,price) SELECT item_cod,item_type_cod,designation,price FROM json_populate_record(
				NULL::items,
				$1 
			);
		END IF;
END	
$$	