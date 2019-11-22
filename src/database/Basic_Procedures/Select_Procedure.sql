CREATE OR REPLACE PROCEDURE Select_Procedure(table_to_use text)
LANGUAGE plpgsql
AS $$
BEGIN
    CASE $1 
            WHEN 'restaurantes' THEN
                SELECT * FROM restaurantes;
            WHEN 'alergias' THEN
                SELECT * FROM alergias
            WHEN 'clientes' THEN
                SELECT * FROM clientes
            WHEN 'consumo' THEN
                SELECT * FROM consumo
            WHEN 'datas' THEN
                SELECT * FROM datas
            WHEN 'ementas' THEN
                SELECT * FROM ementas
            WHEN 'funcionarios' THEN
                SELECT * FROM funcionarios  
            WHEN 'items' THEN
                SELECT * FROM items
            WHEN 'items_ementas' THEN
                SELECT * FROM items_ementas
            WHEN 'locais' THEN
                SELECT * FROM locais
            WHEN 'locais_consumo' THEN
                SELECT * FROM locais_consumo
            WHEN 'tipo_ementa' THEN
                SELECT * FROM tipo_ementa
            WHEN 'tipo_item' THEN
                SELECT * FROM tipo_item
            WHEN 'tipo_local' THEN
                SELECT * FROM tipo_local
            WHEN 'items_alergias' THEN
                SELECT * FROM items_alergias 
END
$$;
