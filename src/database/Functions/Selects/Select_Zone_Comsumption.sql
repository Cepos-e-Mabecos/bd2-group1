CREATE OR REPLACE FUNCTION Select_Zone_Comsumption(arg_zone_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Zone_Comsumptions 
        where Zone_Comsumptions.zone_cod = arg_zone_cod)) THEN
		RETURN (
            Select json_build_object(
			    'Zone_Designation', Zones.zone_cod,
                'Zone_Comsumptions', (
                        select json_object_agg(
                            'Comsumption', Comsumptions.comsumption_cod)
                                FROM Comsumptions
                                    INNER JOIN Zone_Comsumptions
                                        ON Zone_Comsumptions.comsumption_cod = Comsumptions.comsumption_cod
                                            WHERE Zone_Comsumptions.zone_cod = arg_zone_cod
                        ))
                    FROM Zone_Comsumptions 
                        INNER JOIN Zones
                            ON Zone_Comsumptions.zone_cod = Zones.zone_cod
                                WHERE Zone_Comsumptions.zone_cod = arg_zone_cod);
	ELSE
		RAISE 'There is no Zone_Comsumptions with the given Zone Cod!';
	END IF;
END
$$