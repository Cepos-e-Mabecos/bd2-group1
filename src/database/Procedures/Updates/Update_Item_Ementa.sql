CREATE OR REPLACE PROCEDURE Update_Item_Ementa(temp_cod_item int, temp_cod_ementa int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_item,cod_ementa FROM json_populate_record(
        NULL::items_ementas,
        $2
    ))

    -- UPDATE TABLE ITENS_ALERGIAS
    UPDATE items_ementas SET 
        cod_item = s.cod_item,
        cod_ementa = s.cod_ementa
    FROM source AS s
    WHERE 
        items_ementas.cod_item = temp_cod_item 
    AND
        items_ementas.cod_ementa = temp_cod_ementa;

END
$$