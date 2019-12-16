CREATE OR REPLACE PROCEDURE Delete_Local(temp_cod_Local VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Locals where Locals.Local_cod = temp_cod_Local)) THEN
		DELETE FROM Locals
			WHERE Locals.Local_cod = temp_cod_Local;
	ELSE
		RAISE 'There is no Local with that Cod!';
	END IF;
END
$$