CREATE OR REPLACE PROCEDURE Insert_Local(arg_json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		INSERT INTO Locals (local_type_cod, designation) 
			SELECT local_type_cod,designation FROM json_populate_record(
				NULL::Locals,
				$1 
			);
END	
$$	