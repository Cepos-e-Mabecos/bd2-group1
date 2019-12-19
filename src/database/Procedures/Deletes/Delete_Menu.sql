CREATE OR REPLACE PROCEDURE Delete_Menu(arg_menu_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From menus where menus.menu_cod = arg_menu_cod)) THEN
		DELETE FROM menus
			WHERE menus.menu_cod = arg_menu_cod;
	ELSE
		RAISE 'There is no Menu with the given Cod!';
	END IF;
END
$$