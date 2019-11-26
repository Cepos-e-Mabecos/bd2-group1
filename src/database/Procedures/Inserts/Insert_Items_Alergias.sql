CREATE OR REPLACE PROCEDURE Insert_Item_Alergia(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table items alergias
    INSERT INTO items_alergias SELECT cod_item,cod_alergia FROM json_populate_record(
        NULL::items_alergias,
        $1 
    );

END
$$