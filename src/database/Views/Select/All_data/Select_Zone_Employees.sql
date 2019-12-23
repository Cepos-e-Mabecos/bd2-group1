CREATE OR REPLACE VIEW Select_Zone_Employees
AS
SELECT 
    Zones.designation AS Zone, 
    Employees.First_Name || ' ' || Employees.Last_Name AS Employee,
    Zone_Employees.work_hour
    FROM Zone_Employees
        INNER JOIN Zones
            ON Zones.zone_cod = Zone_Employees.zone_cod
        INNER JOIN Employees
            ON Employees.employee_cod = Zone_Employees.employee_cod