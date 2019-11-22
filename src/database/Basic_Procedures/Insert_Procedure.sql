CREATE OR REPLACE PROCEDURE Insert_Procedure(table_to_use text, arguments json)
LANGUAGE plpgsql
AS $$
BEGIN
    CASE $1 
        WHEN 'restaurantes' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'alergias' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'clientes' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'consumo' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'datas' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'ementas' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'funcionarios' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'items' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'items_ementas' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'locais' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'locais_consumo' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'tipo_ementa' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'tipo_item' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'tipo_local' THEN
            INSERT INTO restaurantes VALUES
        WHEN 'items_alergias' THEN
            INSERT INTO restaurantes VALUES
END
$$;
