CREATE OR REPLACE PROCEDURE Delete_Menu(temp_cod_menu BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From menus where menus.menu_cod = temp_cod_menu)) THEN
		DELETE FROM menus
			WHERE menus.menu_cod = temp_cod_menu;
	ELSE
		RAISE 'There is no Menu with that Cod!';
	END IF;
END
$$