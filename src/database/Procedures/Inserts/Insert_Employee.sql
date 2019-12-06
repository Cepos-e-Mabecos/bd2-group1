CREATE OR REPLACE PROCEDURE Insert_Employee(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Employees
    INSERT INTO Employees SELECT first_name,last_name FROM json_populate_record(
        NULL::Employees,
        $1 
    );

END
$$