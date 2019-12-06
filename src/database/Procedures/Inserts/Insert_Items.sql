CREATE OR REPLACE PROCEDURE Insert_Item(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Items
    INSERT INTO Items SELECT cod_item_type,designation,cost FROM json_populate_record(
        NULL::Items,
        $1 
    );

END
$$