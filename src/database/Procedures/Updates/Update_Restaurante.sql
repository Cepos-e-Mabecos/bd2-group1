CREATE OR REPLACE PROCEDURE Update_Restaurante(temp_cod_restaurante int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_local,designacao FROM json_populate_record(
        NULL::restaurantes,
        $2
    ))

    -- UPDATE TABLE restaurantes
    UPDATE restaurantes SET 
        cod_local = s.cod_local,
        designacao = s.designacao
    FROM source AS s
    WHERE restaurantes.cod_restaurante = temp_cod_restaurante;

END
$$