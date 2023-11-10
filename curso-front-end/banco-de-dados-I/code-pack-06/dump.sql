CREATE DATABASE ESCOLA;

CREATE TABLE IF NOT EXISTS ALUNO (
  id SERIAL PRIMARY KEY,
  nome VARCHAR(25) NOT NULL,
  matricula VARCHAR(25) UNIQUE NOT NULL,
  email VARCHAR(35) UNIQUE NOT NULL,
  endereco VARCHAR(100) NOT NULL,
  telefone VARCHAR(11) NOT NULL
);

CREATE TABLE IF NOT EXISTS EMPRESTIMO (
  codigo SERIAL PRIMARY KEY,
  data_hora TIMESTAMP DEFAULT NOW(),
  matric_aluno VARCHAR(25) NOT NULL REFERENCES ALUNO(id),
  data_devolucao DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS SESSAO (
  codigo SERIAL PRIMARY KEY,
  descricao VARCHAR(100) NOT NULL,
  localizacao VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS LIVRO (
  cod_livro SERIAL PRIMARY KEY,
  titulo VARCHAR(100) NOT NULL,
  autor VARCHAR(25) NOT NULL,
  cod_sessao INT REFERENCES SESSAO(codigo)
);

CREATE TABLE IF NOT EXISTS LIVRO_EMPRESTIMO (
  cod_livro INT REFERENCES LIVRO(cod_livro),
  cod_emprestimo INT REFERENCES EMPRESTIMO(codigo),
  PRIMARY KEY (cod_livro, cod_emprestimo)
);

INSERT INTO ALUNO (nome, matricula, email, endereco, telefone) 
VALUES
  ('João Carlos', '1234', 'Jcarlos@gmail.com', 'Rua 13 de maio', '1178254489'),
  ('José Vitor', '2345', 'Jvitor@gmail.com', 'Rua da Saudade', '1178256589'),
  ('Paulo André', '3456', 'Pandr@gmail.com', 'Rua do Sol', '1178254495');

INSERT INTO EMPRESTIMO (data_hora, matric_aluno, data_devolucao)
VALUES
  ('2022-03-12 15:25:00', '1234', '2022-03-15'),
  ('2022-03-15 14:32:00', '3456', '2022-03-18'),
  ('2022-03-20 03:51:00', '2345', '2022-03-23');

INSERT INTO  SESSAO (descricao, localizacao)
VALUES
  ('Sessao 1', 'Partilheira 1'),
  ('Sessao 2', 'Partilheira 2'),
  ('Sessao 3', 'Partilheira 3');

INSERT INTO LIVRO (titulo, autor, cod_sessao) 
VALUES
  ('Modelo COnceitual e Diagrama ER', 'Pressman, Roger S.', 3),
  ('Livro 2: Modelo Relacional e Álgebra Relacional', 'Heuser, Calos Alberto', 1),
  ('Livro 3: Linguagem SQL', 'Beinghley, Lynn', 2);

INSERT INTO (cod_livro, cod_emprestimo)
VALUES
  (3, 1),
  (1, 3),
  (2, 2);