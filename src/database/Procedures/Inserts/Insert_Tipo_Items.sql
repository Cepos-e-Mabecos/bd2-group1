CREATE OR REPLACE PROCEDURE Insert_Tipo_Item(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table tipos_items
    INSERT INTO tipos_items SELECT designacao FROM json_populate_record(
        NULL::tipos_items,
        $1 
    );

END
$$