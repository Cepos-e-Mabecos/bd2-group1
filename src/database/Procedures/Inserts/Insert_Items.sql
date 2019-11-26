CREATE OR REPLACE PROCEDURE Insert_Item(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table items
    INSERT INTO items SELECT cod_tipo_item,designacao,custo FROM json_populate_record(
        NULL::items,
        $1 
    );

END
$$