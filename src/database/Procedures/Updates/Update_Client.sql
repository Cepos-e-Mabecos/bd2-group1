CREATE OR REPLACE PROCEDURE Update_Client(temp_cod_client int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT first_name, last_name, nif FROM json_populate_record(
        NULL::Clients,
        $2
    ))

    -- UPDATE TABLE CLIENTS
    UPDATE Clients SET 
        first_name = s.first_name,
        last_name = s.last_name,
        nif = s.nif
    FROM source AS s
    WHERE cod_client = temp_cod_client;

END
$$