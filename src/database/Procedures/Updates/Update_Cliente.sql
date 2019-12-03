CREATE OR REPLACE PROCEDURE Update_Cliente(temp_cod_cliente int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT nome, nif FROM json_populate_record(
        NULL::clientes,
        $2
    ))

    -- UPDATE TABLE CLIENTES
    UPDATE clientes SET 
        nome = s.nome,
        nif = s.nif
    FROM source AS s
    WHERE clientes.cod_cliente = temp_cod_cliente;

END
$$