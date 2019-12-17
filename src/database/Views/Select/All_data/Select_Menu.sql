CREATE OR REPLACE VIEW Select_Menus
AS
SELECT 
    Menus.menu_cod, 
    Menus.designation, 
    Menu_Types.designation as Menu_Type_Designation
    FROM Menus
        INNER JOIN Menu_Types
            ON Menus.menu_type_cod = Menu_Types.menu_type_cod;