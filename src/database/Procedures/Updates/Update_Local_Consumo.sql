CREATE OR REPLACE PROCEDURE Update_Local_Consumo(temp_cod_local_consumo int, temp_cod_ementa int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT designacao,cupao FROM json_populate_record(
        NULL::locais_consumo,
        $2
    ))

    -- UPDATE TABLE LOCAIS_CONSUMOS
    UPDATE locais_consumo SET 
        designacao = s.designacao,
        cupao = s.cupao
    FROM source AS s
    WHERE 
        locais_consumo.cod_local_consumo = temp_cod_local_consumo;

END
$$