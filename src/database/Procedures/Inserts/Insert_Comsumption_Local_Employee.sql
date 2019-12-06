CREATE OR REPLACE PROCEDURE Insert_Comsumption_Local_Employee(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Comsumption_Local_Employees
    INSERT INTO Comsumption_Local_Employees SELECT cod_employee,cod_comsumption_local,comsumption_locals_employee_date FROM json_populate_record(
        NULL::Comsumption_Local_Employees,
        $1 
    );

END
$$