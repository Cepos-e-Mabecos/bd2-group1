CREATE OR REPLACE PROCEDURE Update_Local(temp_cod_local int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_tipo_local,designacao FROM json_populate_record(
        NULL::locais,
        $2
    ))

    -- UPDATE TABLE locais
    UPDATE locais SET 
        cod_tipo_local = s.cod_tipo_local,
        designacao = s.designacao
    FROM source AS s
    WHERE locais.cod_local = temp_cod_local;

END
$$