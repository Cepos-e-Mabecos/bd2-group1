CREATE OR REPLACE FUNCTION Select_Local_Type(temp_cod_local_type BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Local_Types where Local_Types.local_type_cod = temp_cod_local_type)) THEN
		RETURN (Select json_build_object(
					'Local_Type_Cod',Local_Types.local_type_cod, 
					'Local_Type_Designation',Local_Types.designation)
						FROM Local_Types
                            WHERE Local_Types.local_type_cod = temp_cod_local_type);
	ELSE
		RAISE 'There is no Local_Type with that Cod!';
	END IF;
END
$$