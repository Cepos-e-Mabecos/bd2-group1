CREATE OR REPLACE PROCEDURE Insert_Funcionario(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table funcionarios
    INSERT INTO funcionarios SELECT cod_restaurante,nome FROM json_populate_record(
        NULL::funcionarios,
        $1 
    );

END
$$