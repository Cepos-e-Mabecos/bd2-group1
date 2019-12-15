CREATE OR REPLACE FUNCTION Select_Local(temp_cod_local VARCHAR)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Locals where Locals.local_cod = temp_cod_local)) THEN
		RETURN (Select json_build_object(
					'Local_Cod',locals.local_cod, 
					'Local_Designation',locals.designation, 
					'Local_Type_Designation',local_types.designation) 
						FROM locals INNER JOIN local_types
							ON locals.local_type_cod = local_types.local_type_cod
								WHERE locals.local_cod = temp_cod_local);
	ELSE
		RAISE 'There is no Local with that Cod!';
	END IF;
END
$$
