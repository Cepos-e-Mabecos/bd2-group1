CREATE OR REPLACE VIEW Select_Zone_Comsumptions
AS
SELECT 
    Zones.designation AS Zone, 
    Comsumptions.comsumption_cod
    FROM Zone_Comsumptions
        INNER JOIN Zones
            ON Zones.zone_cod = Zone_Comsumptions.zone_cod
        INNER JOIN Comsumptions
            ON Comsumptions.comsumption_cod = Zone_Comsumptions.comsumption_cod