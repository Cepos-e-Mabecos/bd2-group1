CREATE OR REPLACE PROCEDURE Update_Menu_Date(arg_menu_date_cod BIGINT, arg_json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

	IF(select exists(select 1 From Menu_Dates where Menu_Dates.date_cod = arg_menu_date_cod)) THEN
		-- GET JSON DATA
		WITH source AS (SELECT menu_cod,designation,date_day FROM json_populate_record(
			NULL::Menu_Dates,
			$2
		))

		UPDATE Menu_Dates SET 
            menu_cod = json_data.menu_cod, 
            designation = json_data.designation,
            date_day = json_data.date_day
		FROM source as json_data
		WHERE Menu_Dates.date_cod = arg_menu_date_cod;
	ELSE
		RAISE 'There is no Menu_Date with the given Cod!';
	END IF;
END
$$