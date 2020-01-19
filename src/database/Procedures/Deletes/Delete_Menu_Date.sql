CREATE OR REPLACE PROCEDURE Delete_Menu_Date(arg_menu_date_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Menu_Dates where Menu_Dates.date_cod = arg_menu_date_cod)) THEN
		DELETE FROM Menu_Dates
			WHERE Menu_Dates.date_cod = arg_menu_date_cod;
	ELSE
		RAISE 'There is no Menu_Date with the given Cod!';
	END IF;
END
$$