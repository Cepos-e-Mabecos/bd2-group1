CREATE OR REPLACE FUNCTION Select_Employee(arg_employee_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Employees where Employees.employee_cod = arg_employee_cod)) THEN
		RETURN (Select json_build_object(
					'Employee_Cod', Employees.employee_cod, 
					'Employee_FirstName', Employees.first_name,
					'Employee_LastName', Employees.last_name)
						FROM Employees
                            WHERE Employees.employee_cod = arg_employee_cod);
	ELSE
		RAISE 'There is no Employee with the given Cod!';
	END IF;
END
$$