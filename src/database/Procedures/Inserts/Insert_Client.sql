CREATE OR REPLACE PROCEDURE Insert_Client(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table clientes
    INSERT INTO Clients SELECT first_name, last_name, nif FROM json_populate_record(
        NULL::Clients,
        $1 
    );

END
$$