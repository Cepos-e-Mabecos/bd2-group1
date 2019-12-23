CREATE OR REPLACE PROCEDURE Delete_Zone_Comsumption(arg_zone_cod BIGINT, arg_comsumption_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF(select exists(
            select 1 From Zone_Comsumptions 
                where 
                    Zone_Comsumptions.zone_cod = arg_zone_cod
                AND
                    Zone_Comsumptions.comsumption_cod = arg_comsumption_cod)) THEN
		DELETE FROM Zone_Comsumptions
			WHERE 
                Zone_Comsumptions.comsumption_cod = arg_comsumption_cod
            AND
                Zone_Comsumptions.zone_cod = arg_zone_cod;
	ELSE
		RAISE 'There is no Zone_Comsumption with the given Zone and Comsumption Cod!';
	END IF;
END
$$