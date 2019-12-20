CREATE OR REPLACE FUNCTION Insert_Client(json_data JSON)
RETURNS INTEGER AS $id$
DECLARE id INTEGER;
BEGIN
        INSERT INTO clients (nif,first_name,last_name) 
			SELECT nif,first_name,last_name FROM json_populate_record(
				NULL::clients,
				$1 
		) returning client_cod into id;
        RETURN id;
END
$id$ LANGUAGE plpgsql;