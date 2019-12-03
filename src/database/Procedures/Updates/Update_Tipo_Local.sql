CREATE OR REPLACE PROCEDURE Update_Tipo_Local(temp_cod_tipo_local int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT designacao FROM json_populate_record(
        NULL::tipos_locais,
        $2
    ))

    -- UPDATE TABLE tipos_locais
    UPDATE tipos_locais SET 
        designacao = s.designacao
    FROM source AS s
    WHERE 
        tipos_locais.cod_tipo_local = temp_cod_tipo_local;

END
$$