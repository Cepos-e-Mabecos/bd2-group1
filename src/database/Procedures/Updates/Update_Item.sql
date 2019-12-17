CREATE OR REPLACE PROCEDURE Update_Item(temp_cod_item VARCHAR, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    IF(select exists(select 1 From items where items.item_cod = temp_cod_item)) THEN
        -- GET JSON DATA
        WITH source AS (SELECT item_cod,item_type_cod,designation,price FROM json_populate_record(
            NULL::items,
            $2
        ))
        
        UPDATE items SET 
            item_type_cod = s.item_type_cod,
            designation = s.designation,
            price = s.price
        FROM source as s
        WHERE items.item_cod = temp_cod_item;
    ELSE
        RAISE 'There is no Item with that Cod!';
    END IF;
END