CREATE OR REPLACE PROCEDURE Insert_Client(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		INSERT INTO clients (nif,first_name,last_name) 
			SELECT nif,first_name,last_name FROM json_populate_record(
				NULL::clients,
				$1 
		);
END	
$$	