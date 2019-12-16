CREATE OR REPLACE VIEW Select_Locals
AS
SELECT Locals.local_cod, Local_Types.designation as Local_Type_Designation, Locals.designation FROM Locals
    INNER JOIN Local_Types
        ON Locals.local_type_cod = Local_Types.local_type_cod;