CREATE OR REPLACE FUNCTION Select_Menu(temp_cod_menu VARCHAR)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From menus where menus.menu_cod = temp_cod_menu)) THEN
		RETURN (Select json_build_object(
					'Menu_Cod', menus.menu_cod, 
					'Menu_Type_Cod', menu_types.designation,
                    'Menu_Designation', menus.designation)
						FROM menus INNER JOIN menu_types
                            ON menus.menu_type_cod = menu_types.menu_type_cod
                            WHERE menus.menu_cod = temp_cod_menu);
	ELSE
		RAISE 'There is no Menu with that Cod!';
	END IF;
END
$$