CREATE OR REPLACE PROCEDURE Insert_Consumo(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table consumos
    INSERT INTO consumos SELECT cod_cliente,cod_local_consumo,cod_funcionario,data_consumo FROM json_populate_record(
        NULL::consumos,
        $1 
    );

END
$$