CREATE OR REPLACE PROCEDURE Update_Item(arg_item_cod BIGINT, arg_json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    IF(select exists(select 1 From items where items.item_cod = arg_item_cod)) THEN
        
        -- GET JSON DATA
		WITH source AS (SELECT item_type_cod,designation,price FROM json_populate_record(
			NULL::items,
			$2
		))

        UPDATE items SET 
            item_type_cod = json_data.item_type_cod,
            designation = json_data.designation,
            price = json_data.price
        FROM source as json_data
        WHERE items.item_cod = arg_item_cod;
    ELSE
        RAISE 'There is no Item with the given Cod!';
    END IF;
END
$$