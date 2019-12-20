CREATE OR REPLACE FUNCTION Insert_Zone(json_data JSON)
RETURNS INTEGER AS $id$
DECLARE id INTEGER;
BEGIN
        INSERT INTO zones (restaurant_cod,designation) 
			SELECT restaurant_cod,designation FROM json_populate_record(
				NULL::zones,
				$1 
		) returning zone_cod into id;
        RETURN id;
END
$id$ LANGUAGE plpgsql;