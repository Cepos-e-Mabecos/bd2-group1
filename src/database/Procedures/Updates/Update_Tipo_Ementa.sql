CREATE OR REPLACE PROCEDURE Update_Tipo_Ementa(temp_cod_tipo_ementa int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT designacao FROM json_populate_record(
        NULL::tipos_ementas,
        $2
    ))

    -- UPDATE TABLE tipos_ementas
    UPDATE tipos_ementas SET 
        designacao = s.designacao
    FROM source AS s
    WHERE 
        tipos_ementas.cod_tipo_ementa = temp_cod_tipo_ementa;

END
$$