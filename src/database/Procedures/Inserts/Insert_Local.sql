CREATE OR REPLACE PROCEDURE Insert_Local(json_data JSON)
LANGUAGE plpgsql
AS $$
DECLARE
	local_temp VARCHAR;
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT local_cod,local_type_cod,designation FROM json_populate_record(
			NULL::Locals,
			$1
		))
		
		SELECT source.local_cod INTO local_temp FROM source;
		
		IF(select exists(select 1 From Locals where Locals.local_cod = local_temp)) THEN
			RAISE 'There is already a Local created with that Cod!';
		ELSE
			INSERT INTO Locals (local_cod,local_type_cod, designation) SELECT local_cod,local_type_cod,designation FROM json_populate_record(
				NULL::Locals,
				$1 
			);
		END IF;
END	
$$	