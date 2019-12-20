CREATE OR REPLACE FUNCTION Select_Zone_Employee(arg_zone_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Zone_Employees 
        where Zone_Employees.zone_cod = arg_zone_cod)) THEN
		RETURN (
            Select json_build_object(
			    'Zone_Designation', zones.designation,
                'Zone_Employees', (
                        select json_object_agg(
                            'Employee', Employees.First_Name || ' ' || Employees.Last_Name)
                                FROM Employees
                                    INNER JOIN Zone_Employees
                                        ON Zone_Employees.employee_cod = Employees.employee_cod
                                            WHERE Zone_Employees.zone_cod = arg_zone_cod
                        ))
                    FROM Zone_Employees 
                        INNER JOIN Zones
                            ON Zone_Employees.zone_cod = zones.zone_cod
                                WHERE Zone_Employees.zone_cod = arg_zone_cod);
	ELSE
		RAISE 'There is no Zone_Employees with the given Zone Cod!';
	END IF;
END
$$