CREATE OR REPLACE PROCEDURE Delete_Employee(temp_cod_employee VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Employees where Employees.employee_cod = temp_cod_employee)) THEN
		DELETE FROM Employees
			WHERE Employees.employee_cod = temp_cod_employee;
	ELSE
		RAISE 'There is no Employee with that Cod!';
	END IF;
END
$$