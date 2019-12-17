CREATE OR REPLACE PROCEDURE Update_Local(temp_cod_local BIGINT, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

	IF(select exists(select 1 From Locals where Locals.Local_cod = temp_cod_local)) THEN
		-- GET JSON DATA
		WITH source AS (SELECT local_type_cod,designation FROM json_populate_record(
			NULL::Locals,
			$2
		))
		
		UPDATE Locals SET 
			local_type_cod = s.local_type_cod,
			designation = s.designation
		FROM source as s
		WHERE locals.local_cod = temp_cod_local;
	ELSE
		RAISE 'There is no Local with that Cod!';
	END IF;
END
$$