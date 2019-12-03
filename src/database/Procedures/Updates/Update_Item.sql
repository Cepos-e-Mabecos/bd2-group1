CREATE OR REPLACE PROCEDURE Update_Item(temp_cod_item int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_tipo_item,designacao,custo FROM json_populate_record(
        NULL::items,
        $2
    ))

    -- UPDATE TABLE itemS
    UPDATE items SET 
        cod_tipo_item = s.cod_tipo_item,
        designacao = s.designacao,
        custo = s.custo
    FROM source AS s
    WHERE items.cod_item = temp_cod_item;

END
$$