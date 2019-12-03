CREATE OR REPLACE PROCEDURE Update_Consumo(temp_cod_consumo int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_cliente, cod_local_consumo , cod_funcionario, data_consumo FROM json_populate_record(
        NULL::consumos,
        $2
    ))

    -- UPDATE TABLE CONSUMOS
    UPDATE consumos SET 
        cod_cliente = s.cod_cliente,
        cod_local_consumo = s.cod_local_consumo,
        cod_funcionario = s.cod_funcionario
        data_consumo = s.data_consumo
    FROM source AS s
    WHERE consumos.cod_consumo = temp_cod_consumo;

END
$$