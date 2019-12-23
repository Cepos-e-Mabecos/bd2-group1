CREATE OR REPLACE PROCEDURE Update_Local(arg_local_cod BIGINT, arg_json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

	IF(select exists(select 1 From Locals where Locals.Local_cod = arg_local_cod)) THEN
		
		-- GET JSON DATA
		WITH source AS (SELECT local_type_cod,designation FROM json_populate_record(
			NULL::locals,
			$2
		))

		UPDATE Locals SET 
			local_type_cod = json_data.local_type_cod,
			designation = json_data.designation
		FROM source as json_data
		WHERE locals.local_cod = arg_local_cod;
	ELSE
		RAISE 'There is no Local with the given Cod!';
	END IF;
END
$$