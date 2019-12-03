CREATE OR REPLACE PROCEDURE Update_Data(temp_cod_data int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT dia, hora FROM json_populate_record(
        NULL::datas,
        $2
    ))

    -- UPDATE TABLE DATAS
    UPDATE datas SET 
        dia = s.dia,
        hora = s.hora
    FROM source AS s
    WHERE datas.cod_data = temp_cod_data;

END
$$