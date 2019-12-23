CREATE OR REPLACE FUNCTION Select_Comsumption(temp_cod_comsumption BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Comsumptions where Comsumptions.comsumption_cod = temp_cod_comsumption)) THEN
	
		RETURN (Select json_build_object(
					'Comsumption_Cod', Comsumptions.comsumption_cod, 
					'Comsumption_Client_Nif', Clients.nif,
                    'Comsumption_Date', Comsumptions.comsumption_date
						FROM Comsumptions INNER JOIN Clients
							ON Comsumptions.nif = Clients.nif
                            	WHERE Comsumptions.comsumption_cod = temp_cod_comsumption);
	ELSE
		RAISE 'There is no Comsumption with that Cod!';
	END IF;
END
$$

