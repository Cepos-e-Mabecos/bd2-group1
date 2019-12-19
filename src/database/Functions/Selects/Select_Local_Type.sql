CREATE OR REPLACE FUNCTION Select_Local_Type(arg_local_type_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Local_Types where Local_Types.local_type_cod = arg_local_type_cod)) THEN
		RETURN (Select json_build_object(
					'Local_Type_Cod:',Local_Types.local_type_cod, 
					'Designation:',Local_Types.designation)
						FROM Local_Types
                            WHERE Local_Types.local_type_cod = arg_local_type_cod);
	ELSE
		RAISE 'There is no Local_Type with the given Cod!';
	END IF;
END
$$