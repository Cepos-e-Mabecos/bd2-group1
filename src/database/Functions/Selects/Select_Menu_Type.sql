CREATE OR REPLACE FUNCTION Select_Menu_Type(temp_cod_menu_type BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Menu_Types where Menu_Types.menu_type_cod = temp_cod_menu_type)) THEN
		RETURN (Select json_build_object(
					'Menu_Type_Cod',Menu_Types.menu_type_cod, 
					'Menu_Type_Designation',Menu_Types.designation)
						FROM Menu_Types
                            WHERE Menu_Types.menu_type_cod = temp_cod_menu_type);
	ELSE
		RAISE 'There is no Menu_Type with that Cod!';
	END IF;
END
$$