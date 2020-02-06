CREATE OR REPLACE FUNCTION Select_Menu_Date(temp_cod_menu BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Menus_Dates where Menus_Dates.menu_cod = temp_cod_menu)) THEN
		RETURN (Select json_build_object(
					'Menu_Date_Menu_Cod', Menus_Dates.menu_cod,
                    'Menu_Date_Designation', Menus_Dates.designation,
                    'Menu_Date_Date_Day', Menus_Dates.date_day)
						FROM Menus_Dates 
                            where Menus_Dates.menu_cod = temp_cod_menu);
	ELSE
		RAISE 'There is no Menu_Date with that Cod!';
	END IF;
END
$$