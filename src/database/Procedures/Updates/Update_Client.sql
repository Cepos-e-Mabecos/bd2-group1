CREATE OR REPLACE PROCEDURE Update_Client(arg_cod_client VARCHAR, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    IF(select exists(select 1 From clients where clients.nif = arg_cod_client)) THEN
         
         -- GET JSON DATA
		WITH source AS (SELECT first_name,last_name FROM json_populate_record(
			NULL::clients,
			$2
		))

        UPDATE clients SET 
            first_name = s.first_name,
            last_name = s.last_name
        FROM source as s
        WHERE clients.nif = arg_cod_client;
    ELSE
        RAISE 'There is no Client with the given Cod!';
    END IF;
END
$$