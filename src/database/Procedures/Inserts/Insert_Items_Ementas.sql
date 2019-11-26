CREATE OR REPLACE PROCEDURE Insert_Item_Ementa(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table items_ementas
    INSERT INTO items_ementas SELECT cod_item,cod_ementa FROM json_populate_record(
        NULL::items_ementas,
        $1 
    );

END
$$