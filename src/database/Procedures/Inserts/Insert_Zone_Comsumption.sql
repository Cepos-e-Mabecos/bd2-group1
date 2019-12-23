CREATE OR REPLACE PROCEDURE Insert_Zone_Comsumption(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		INSERT INTO Zone_Comsumptions (zone_cod,comsumption_cod) 
			SELECT zone_cod,comsumption_cod FROM json_populate_record(
				NULL::Zone_Comsumptions,
				$1 
		);
END	
$$	