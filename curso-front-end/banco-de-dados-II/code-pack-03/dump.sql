CREATE PROCEDURE RelatorioDiarioVendas AS
BEGIN
    SELECT data_venda, SUM(iv.qtd_produto) as total_produtos_comprados
    FROM vendas v
    LEFT JOIN itens_vendas iv ON iv.venda_id = v.id
    GROUP BY data_venda
    ORDER BY data_venda DESC;
END;