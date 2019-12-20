CREATE OR REPLACE PROCEDURE Insert_Zone_Employee(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		INSERT INTO Zone_Employees (zone_cod,employee_cod) 
			SELECT zone_cod,employee_cod FROM json_populate_record(
				NULL::Zone_Employees,
				$1 
		);
END	
$$	