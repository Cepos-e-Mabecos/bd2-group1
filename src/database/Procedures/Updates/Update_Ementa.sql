CREATE OR REPLACE PROCEDURE Update_Ementa(temp_cod_ementa int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_tipo_ementa,cod_restaurante,cod_data FROM json_populate_record(
        NULL::ementas,
        $2
    ))

    -- UPDATE TABLE EMENTAS
    UPDATE ementas SET 
        dia = s.dia,
        hora = s.hora
    FROM source AS s
    WHERE ementas.cod_ementa = temp_cod_ementa;

END
$$