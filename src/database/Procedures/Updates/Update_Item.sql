CREATE OR REPLACE PROCEDURE Update_Item(temp_cod_item int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_item_type,designation,cost FROM json_populate_record(
        NULL::Items,
        $2
    ))

    -- UPDATE TABLE Items
    UPDATE Items SET 
        cod_item_type = s.cod_item_type,
        designation = s.designation,
        cost = s.cost
    FROM source AS s
    WHERE cod_item = temp_cod_item;

END
$$