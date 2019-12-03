CREATE OR REPLACE PROCEDURE Update_Alergia(temp_cod_alergia int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT nome FROM json_populate_record(
        NULL::alergias,
        $2
    ))

    -- UPDATE TABLE ALERGIAS
    UPDATE alergias SET nome = s.nome
    FROM source AS s
    WHERE alergias.cod_alergia = temp_cod_alergia;

END
$$