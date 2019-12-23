CREATE OR REPLACE PROCEDURE Delete_Zone_Employee(arg_zone_cod BIGINT, arg_employee_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF(select exists(
            select 1 From Zone_Employees 
                where 
                    Zone_Employees.zone_cod = arg_zone_cod
                AND
                    Zone_Employees.employee_cod = arg_employee_cod)) THEN
		DELETE FROM Zone_Employees
			WHERE 
                Zone_Employees.employee_cod = arg_employee_cod
            AND
                Zone_Employees.zone_cod = arg_zone_cod;
	ELSE
		RAISE 'There is no Zone_Employee with the given Zone and Employee Cod!';
	END IF;
END
$$