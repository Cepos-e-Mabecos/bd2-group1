CREATE OR REPLACE PROCEDURE Delete_Local(arg_local_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF(select exists(select 1 From Locals where Locals.Local_cod = arg_local_cod)) THEN
		DELETE FROM Locals
			WHERE Locals.Local_cod = arg_local_cod;
	ELSE
		RAISE 'There is no Local with the given Cod!';
	END IF;
END
$$