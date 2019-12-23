CREATE OR REPLACE FUNCTION Insert_Allergy(json_data JSON)
RETURNS INTEGER AS $id$
DECLARE id INTEGER;
BEGIN
        INSERT INTO allergies (designation,symptom) 
			SELECT designation,symptom FROM json_populate_record(
				NULL::allergies,
				$1 
		) returning allergy_cod into id;
        RETURN id;
END
$id$ LANGUAGE plpgsql;