CREATE OR REPLACE FUNCTION Select_Client(temp_cod_client VARCHAR)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From clients where clients.nif = temp_cod_client)) THEN
		RETURN (Select json_build_object(
					'Client_Nif', clients.nif,
                    'Client_FirstName', clients.first_name,
					'Client_LastName',clients.last_name)
						FROM clients 
                            WHERE clients.nif = temp_cod_client);
	ELSE
		RAISE 'There is no Client with that Nif!';
	END IF;
END
$$