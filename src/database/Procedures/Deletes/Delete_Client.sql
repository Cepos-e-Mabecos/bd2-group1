CREATE OR REPLACE PROCEDURE Delete_Client(arg_client_cod VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From clients where clients.nif = arg_client_cod)) THEN
		DELETE FROM clients
			WHERE clients.nif = arg_client_cod;
	ELSE
		RAISE 'There is no Client with that Cod!';
	END IF;
END
$$