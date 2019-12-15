CREATE OR REPLACE FUNCTION Select_Employee(temp_cod_employee VARCHAR)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Employees where Employees.employee_cod = temp_cod_Employee)) THEN
		RETURN (Select json_build_object(
					'Employee_Cod', Employees.employee_cod, 
					'Employee_Designation', Employees.first_name || ' ' || Employees.last_name)
						FROM Employees
                            WHERE Employees.employee_cod = temp_cod_employee);
	ELSE
		RAISE 'There is no Employee with that Cod!';
	END IF;
END
$$