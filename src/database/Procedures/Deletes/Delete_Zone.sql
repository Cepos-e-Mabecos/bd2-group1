CREATE OR REPLACE PROCEDURE Delete_Zone(temp_cod_zone BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Zones where Zones.zone_cod = temp_cod_zone)) THEN
		DELETE FROM Zones
			WHERE Zones.zone_cod = temp_cod_zone;
	ELSE
		RAISE 'There is no zone with that Cod!';
	END IF;
END
$$