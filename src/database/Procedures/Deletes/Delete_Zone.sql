CREATE OR REPLACE PROCEDURE Delete_Zone(arg_zone_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Zones where Zones.zone_cod = arg_zone_cod)) THEN
		DELETE FROM Zones
			WHERE Zones.zone_cod = arg_zone_cod;
	ELSE
		RAISE 'There is no Zone with the given Cod!';
	END IF;
END
$$