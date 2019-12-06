CREATE OR REPLACE PROCEDURE Update_Item_Type(temp_cod_item_type int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT designation FROM json_populate_record(
        NULL::Item_Types,
        $2
    ))

    -- UPDATE TABLE Item_Types
    UPDATE Item_Types SET 
        designation = s.designation
    FROM source AS s
    WHERE 
        cod_item_type = temp_cod_item_type;

END
$$