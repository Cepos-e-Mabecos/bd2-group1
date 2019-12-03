CREATE OR REPLACE PROCEDURE Update_Tipo_Item(temp_cod_tipo_item int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT designacao FROM json_populate_record(
        NULL::tipos_items,
        $2
    ))

    -- UPDATE TABLE tipos_items
    UPDATE tipos_items SET 
        designacao = s.designacao
    FROM source AS s
    WHERE 
        tipos_items.cod_tipo_item = temp_cod_tipo_item;

END
$$