CREATE OR REPLACE VIEW Select_Menu_Dates
AS
SELECT 
    Menu_Dates.date_cod,
    Menu_Dates.menu_cod,
    Menu_Dates.designation,
    Menu_Dates.date_day
    FROM Menu_Dates