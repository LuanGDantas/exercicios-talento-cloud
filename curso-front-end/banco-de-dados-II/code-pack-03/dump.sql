CREATE TABLE IF NOT EXISTS produtos (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  codigo VARCHAR(50) UNIQUE NOT NULL,
  qtd_estoque INT NOT NULL,
  preco NUMERIC(10,2) NOT NULL
);

INSERT INTO produtos (nome, codigo, qtd_estoque, preco) 
VALUES 
  ('Arroz Parbolizado tio João 1Kg', '1234567890123', 120, 3.99),
  ('Açucar União 1Kg', '1234567890134', 300, 2.99),
  ('Biscoito Cream Cracker 300g', '1234567890145', 100, 5.99),
  ('Macarrão Estrela 500g', '1234567890156', 220, 2.49),
  ('Farinha Sertaneja 1Kg', '1234567890178', 75, 6.99);
 
SELECT * FROM produtos p;

CREATE TABLE IF NOT EXISTS vendas (
  id SERIAL PRIMARY KEY,
  produto_id INT REFERENCES produtos(id),
  qtd_produto INT NOT NULL
  data_venda DATE NOT NULL
);

INSERT INTO vendas (produto_id, qtd_produto, data_venda) 
VALUES 
  (1, 2, NOW()),
  (3, 2, NOW()),
  (4, 4, NOW()),
  (3, 1, '2023-11-09'),
  (2, 5, '2023-11-08'),
  (5, 1, '2023-11-07');


DELIMITER $$
CREATE PROCEDURE RelatorioDiarioVendas AS
BEGIN
  SELECT data_venda, SUM(qtd_produto) as total_produtos_comprados
  FROM vendas v
  GROUP BY data_venda
  ORDER BY data_venda DESC;
END $$
DELIMITER;
