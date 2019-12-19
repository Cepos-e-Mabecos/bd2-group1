CREATE OR REPLACE PROCEDURE Update_Comsumption(arg_comsumption_cod BIGINT, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    IF(select exists(select 1 From comsumptions where comsumptions.comsumption_cod = arg_comsumption_cod)) THEN
      
      -- GET JSON DATA
		WITH source AS (SELECT nif,comsumption_date FROM json_populate_record(
			NULL::comsumptions,
			$2
		))

        UPDATE comsumptions SET 
            nif = s.nif,
            comsumption_date = s.comsumption_date
        FROM source as s
        WHERE comsumptions.comsumption_cod = arg_comsumption_cod;
    ELSE
        RAISE 'There is no Comsumption with the given Cod!';
    END IF;
END
$$