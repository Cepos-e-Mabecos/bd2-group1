CREATE OR REPLACE PROCEDURE Update_Item_Alergia(temp_cod_item int, temp_cod_alergia int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_item,cod_alergia FROM json_populate_record(
        NULL::items_alergias,
        $2
    ))

    -- UPDATE TABLE ITENS_ALERGIAS
    UPDATE items_alergias SET 
        cod_item = s.cod_item,
        cod_alergia = s.cod_alergia
    FROM source AS s
    WHERE 
        items_alergias.cod_item = temp_cod_item 
    AND
        items_alergias.cod_alergia = temp_cod_alergia;

END
$$