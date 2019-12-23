CREATE OR REPLACE PROCEDURE Delete_Comsumption(arg_comsumption_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From comsumptions where comsumptions.comsumption_cod = arg_comsumption_cod)) THEN
		DELETE FROM comsumptions
			WHERE comsumptions.comsumption_cod = arg_comsumption_cod;
	ELSE
		RAISE 'There is no Comsumption with the given Cod!';
	END IF;
END
$$