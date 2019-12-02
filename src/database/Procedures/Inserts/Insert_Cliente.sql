CREATE OR REPLACE PROCEDURE Insert_Cliente(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table clientes
    INSERT INTO clientes SELECT nome, nif FROM json_populate_record(
        NULL::clientes,
        $1 
    );

END
$$