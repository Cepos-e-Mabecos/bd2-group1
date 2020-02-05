CREATE OR REPLACE FUNCTION Select_Menu_Date(temp_cod_menu_date BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Menu_Dates where Menu_Dates.date_cod = temp_cod_menu_date)) THEN
		RETURN (Select json_build_object(
					'Menu_Date_Menu_Cod', Menu_Dates.menu_cod,
                    'Menu_Date_Designation' Menu_Dates.designation,
                    'Menu_Date_Date_Day' Menu_Dates.date_day)
						FROM Menu_Dates 
                            WHERE Menu_Dates.date_cod = temp_cod_menu_date);
	ELSE
		RAISE 'There is no Menu_Date with that Cod!';
	END IF;
END
$$