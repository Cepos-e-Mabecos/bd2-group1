CREATE OR REPLACE PROCEDURE Insert_Comsumption(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN		
		INSERT INTO comsumptions (nif, comsumption_date) 
			SELECT nif, comsumption_date FROM json_populate_record(
				NULL::comsumptions,
				$1 
		);
END	
$$	