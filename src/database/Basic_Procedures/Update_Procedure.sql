CREATE OR REPLACE PROCEDURE Update_Procedure(table_to_use text, arguments json)
LANGUAGE plpgsql
AS $$
BEGIN
    CASE $1 
        WHEN 'restaurantes' THEN
            UPDATE restaurantes SET
        WHEN 'alergias' THEN
            UPDATE alergias SET
        WHEN 'clientes' THEN
            UPDATE clientes SET
        WHEN 'consumo' THEN
            UPDATE consumo SET
        WHEN 'datas' THEN
            UPDATE datas SET
        WHEN 'ementas' THEN
            UPDATE ementas SET
        WHEN 'funcionarios' THEN
            UPDATE funcionarios SET
        WHEN 'items' THEN
            UPDATE items SET
        WHEN 'items_ementas' THEN
            UPDATE items_ementas SET
        WHEN 'locais' THEN
            UPDATE locais SET
        WHEN 'locais_consumo' THEN
            UPDATE locais_consumo SET
        WHEN 'tipo_ementa' THEN
            UPDATE tipo_ementa SET
        WHEN 'tipo_item' THEN
            UPDATE tipo_item SET
        WHEN 'tipo_local' THEN
            UPDATE tipo_local SET
        WHEN 'items_alergias' THEN
            UPDATE items_alergias SET
END
$$;