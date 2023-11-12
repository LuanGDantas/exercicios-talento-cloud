CREATE DATABASE academia;

CREATE TABLE IF NOT EXISTS instrutores (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(25) NOT NULL,
  telefone VARCHAR(11) NOT NULL
);


CREATE TABLE IF NOT EXISTS alunos (
  id SERIAL PRIMARY KEY,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  nome VARCHAR(25) NOT NULL,
  data_nascimento DATE NOT NULL,
  altura INT NOT NULL, -- Altura em cm
  peso INT NOT NULL, -- Peso em gramas
  telefone VARCHAR(11) NOT NULL
  instrutor_id INT REFERENCES instrutores(id)
);

INSERT INTO instrutores (nome, telefone)
VALUES
  ('Rafaela Silva', '21999887766'),
  ('Julio Balestrim', '21999876543'),
  ('Johann Schatz', '21991234567');

SELECT * FROM instrutores;

INSERT INTO alunos (cpf, nome, data_nascimento, altura, peso, telefone, instrutor_id)
 VALUES
  ('12345678900', 'João de Deus', '2000-01-01', 175, 70000, '84996889977', 1),
  ('23456789011', 'Maria da Silva', '2001-02-02', 165, 60000, '84988281732', 1),
  ('34567890122', 'Pedro Sousa', '2002-03-03', 180, 80000, '84996771234', 2),
  ('45678901233', 'Ana Fagundes', '2003-04-04', 170, 65000, '84996765566', 2),
  ('56789012344', 'Carlos Oliveira', '2004-05-05', 185, 85000, '84999554285', NULL);

SELECT * FROM alunos;

-- Selecionar nome dos alunos com o nome do seu respectivo instrutor
SELECT a.nome aluno, i.nome instrutor
FROM alunos a
LEFT JOIN instrutores i ON i.id = a.instrutor_id
ORDER BY a.nome ASC;
