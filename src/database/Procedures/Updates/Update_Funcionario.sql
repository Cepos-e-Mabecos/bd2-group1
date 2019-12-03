CREATE OR REPLACE PROCEDURE Update_Funcionario(temp_cod_funcionario int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_restaurante,nome FROM json_populate_record(
        NULL::funcionarios,
        $2
    ))

    -- UPDATE TABLE FUNCIONARIOS
    UPDATE funcionarios SET 
        cod_restaurante = s.cod_restaurante,
        nome = s.nome
    FROM source AS s
    WHERE funcionarios.cod_funcionario = temp_cod_funcionario;

END
$$