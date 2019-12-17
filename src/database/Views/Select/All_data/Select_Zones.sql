CREATE OR REPLACE VIEW Select_Zones
AS
SELECT 
    Zones.zone_cod,
    Restaurants.designation AS Restaurants,
    Employees.First_name || ' ' || Employees.Last_name,
    Zones.designation AS Designation
        FROM Zones
            INNER JOIN Restaurants
                ON Zones.restaurant_cod = Restaurants.restaurant_cod
            INNER JOIN Employees
                ON Zones.employee_cod = Employees.employee_cod;