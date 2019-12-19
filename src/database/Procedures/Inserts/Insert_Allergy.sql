CREATE OR REPLACE PROCEDURE Insert_Allergy(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		INSERT INTO allergies (designation,symptom) 
			SELECT designation,symptom FROM json_populate_record(
				NULL::allergies,
				$1 
		);
END	
$$	