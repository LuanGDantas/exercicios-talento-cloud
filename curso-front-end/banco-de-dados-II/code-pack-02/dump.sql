CREATE DATABASE mercado;

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
  data_hora TIMESTAMP NOT NULL
);

CREATE TABLE itens_vendas (
  id SERIAL PRIMARY KEY,
  venda_id INT REFERENCES vendas(id),
  produto_id INT REFERENCES produtos(id),
  quantidade INT NOT NULL
);


-- FUNÇÃO DO TRIGGER
CREATE OR REPLACE FUNCTION diminuir_produto_estoque() 
RETURNS TRIGGER AS $$
BEGIN
  UPDATE produtos SET qtd_estoque = qtd_estoque - NEW.quantidade
  WHERE id = NEW.produto_id;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- TRIGGER
CREATE OR REPLACE TRIGGER diminuir_produto_estoque
AFTER INSERT
ON itens_vendas
FOR EACH ROW
EXECUTE FUNCTION diminuir_produto_estoque();


INSERT INTO vendas (data_hora) VALUES (NOW());

SELECT * FROM vendas v;

INSERT INTO itens_vendas (venda_id, produto_id, quantidade) 
VALUES 
  (1, 3, 1), 
  (1, 1, 2), 
  (1, 2, 1), 
  (1, 5, 1);
 
 SELECT * FROM itens_vendas iv;

