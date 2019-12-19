CREATE OR REPLACE PROCEDURE Delete_Employee(arg_employee_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Employees where Employees.employee_cod = arg_employee_cod)) THEN
		DELETE FROM Employees
			WHERE Employees.employee_cod = arg_employee_cod;
	ELSE
		RAISE 'There is no Employee with the given Cod!';
	END IF;
END
$$