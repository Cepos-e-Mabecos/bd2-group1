CREATE OR REPLACE FUNCTION Insert_Local(json_data JSON)
RETURNS INTEGER AS $id$
DECLARE id INTEGER;
BEGIN
        INSERT INTO Locals (local_type_cod, designation) 
			SELECT local_type_cod,designation FROM json_populate_record(
				NULL::Locals,
				$1 
		) returning local_cod into id;
        RETURN id;
END
$id$ LANGUAGE plpgsql;