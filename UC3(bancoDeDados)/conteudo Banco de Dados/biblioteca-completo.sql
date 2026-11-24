-- #####################################################
-- PARTE 1: criando a biblioteca
-- #####################################################


-- 1. Ver os bancos que já existem no servidor
SHOW DATABASES;

-- 2. Criar o banco e começar a usá-lo
CREATE DATABASE IF NOT EXISTS biblioteca
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci;

USE biblioteca;

-- =====================================================
-- 3. Tabelas SEM chave estrangeira primeiro
-- =====================================================

CREATE TABLE editora (
  id_editora INT AUTO_INCREMENT PRIMARY KEY,
  nome       VARCHAR(100) NOT NULL,
  rua        VARCHAR(150),
  numero     VARCHAR(10),
  cidade     VARCHAR(80),
  uf         CHAR(2),
  cep        CHAR(9),
  email      VARCHAR(100)
);

CREATE TABLE autor (
  id_autor INT AUTO_INCREMENT PRIMARY KEY,
  nome     VARCHAR(100) NOT NULL
);

-- =====================================================
-- 4. Tabelas que dependem das anteriores
-- =====================================================

-- Regra 4 (1:N): livro recebe a PK da editora como FK
CREATE TABLE livro (
  isbn        VARCHAR(17) PRIMARY KEY,
  titulo      VARCHAR(150) NOT NULL,
  num_paginas INT,
  preco       DECIMAL(10,2),
  id_editora  INT NOT NULL,
  FOREIGN KEY (id_editora) REFERENCES editora(id_editora)
);

-- Regra 2 (entidade fraca): a cópia leva o isbn e a chave fica composta
CREATE TABLE copia (
  isbn           VARCHAR(17),
  num_copia      INT,
  data_aquisicao DATE,
  PRIMARY KEY (isbn, num_copia),
  FOREIGN KEY (isbn) REFERENCES livro(isbn)
);

-- Regra 5 (N:N): tabela nova com as duas PKs
CREATE TABLE livro_autor (
  isbn     VARCHAR(17),
  id_autor INT,
  PRIMARY KEY (isbn, id_autor),
  FOREIGN KEY (isbn)     REFERENCES livro(isbn),
  FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

-- Regra 6 (multivalorado): tabela nova com o atributo e a PK do dono
CREATE TABLE autor_formacao (
  id_autor INT,
  formacao VARCHAR(80),
  PRIMARY KEY (id_autor, formacao),
  FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

-- Conferir o que foi criado
SHOW TABLES;
DESCRIBE livro;

-- =====================================================
-- 5. Inserir dados (dados ilustrativos)
-- =====================================================

INSERT INTO editora (nome, cidade, uf, email)
VALUES ('Editora Aurora', 'São Paulo', 'SP', 'contato@aurora.com'),
       ('Editora Horizonte', 'Rio de Janeiro', 'RJ', 'contato@horizonte.com');

INSERT INTO autor (nome)
VALUES ('Machado de Assis'), ('Aluísio Azevedo');

INSERT INTO autor_formacao (id_autor, formacao)
VALUES (1, 'Jornalismo'), (1, 'Literatura');

INSERT INTO livro (isbn, titulo, num_paginas, preco, id_editora)
VALUES ('978-85-000-0001-1', 'Dom Casmurro', 256, 39.90, 1),
       ('978-85-000-0002-8', 'O Cortiço', 304, 34.90, 2);

INSERT INTO livro_autor (isbn, id_autor)
VALUES ('978-85-000-0001-1', 1),
       ('978-85-000-0002-8', 2);

INSERT INTO copia (isbn, num_copia, data_aquisicao)
VALUES ('978-85-000-0001-1', 1, '2026-03-10'),
       ('978-85-000-0001-1', 2, '2026-05-22'),
       ('978-85-000-0002-8', 1, '2026-04-02');

-- =====================================================
-- 6. Consultar
-- =====================================================

SELECT * FROM livro;

SELECT titulo, preco FROM livro WHERE preco < 38;

-- =====================================================
-- 7. Testando a FK (este comando DEVE dar erro)
-- Não existe editora 99, então o banco recusa o livro.
-- =====================================================

INSERT INTO livro (isbn, titulo, num_paginas, preco, id_editora)
VALUES ('978-85-000-0003-5', 'Iracema', 160, 29.90, 99);


-- #####################################################
-- PARTE 2: alterando estrutura e dados
-- #####################################################


USE biblioteca;

-- =====================================================
-- 0. Mais dados para os filtros ficarem interessantes
-- =====================================================

INSERT INTO editora (nome, cidade, uf)
VALUES ('Editora Pássaro', 'Curitiba', 'PR');   -- id 3, ainda sem livros

INSERT INTO autor (nome)
VALUES ('José de Alencar'), ('Clarice Lispector');   -- ids 3 e 4

INSERT INTO livro (isbn, titulo, num_paginas, preco, id_editora)
VALUES ('978-85-000-0003-5', 'Iracema', 160, 29.90, 1),
       ('978-85-000-0004-2', 'A Hora da Estrela', 88, 32.50, 2),
       ('978-85-000-0005-9', 'O Guarani', 420, 45.00, 1),
       ('978-85-000-0006-6', 'Memórias Póstumas de Brás Cubas', 368, 41.90, 1);

INSERT INTO livro_autor (isbn, id_autor)
VALUES ('978-85-000-0003-5', 3),
       ('978-85-000-0004-2', 4),
       ('978-85-000-0005-9', 3),
       ('978-85-000-0006-6', 1);

SELECT * FROM livro;


-- =====================================================
-- 1. DDL: ALTER TABLE (mudar a ESTRUTURA)
-- =====================================================

-- Adicionar uma coluna
ALTER TABLE livro ADD COLUMN ano_publicacao INT;

-- Adicionar uma coluna com valor padrão
ALTER TABLE autor ADD COLUMN nacionalidade VARCHAR(50) DEFAULT 'Brasileira';

-- Mudar o tipo ou as regras de uma coluna
ALTER TABLE livro MODIFY COLUMN titulo VARCHAR(200) NOT NULL;

-- Renomear uma coluna (nome antigo, nome novo, tipo)
ALTER TABLE livro CHANGE COLUMN num_paginas paginas INT;
DESCRIBE livro;

-- ...e voltar ao nome original
ALTER TABLE livro CHANGE COLUMN paginas num_paginas INT;

-- Remover uma coluna (os dados dela somem junto!)
ALTER TABLE autor DROP COLUMN nacionalidade;

DESCRIBE livro;
DESCRIBE autor;


-- =====================================================
-- 2. WHERE: filtrando as linhas
-- =====================================================

-- Igual / diferente
SELECT * FROM livro WHERE id_editora = 1;
SELECT * FROM livro WHERE id_editora <> 1;

-- Maior / menor
SELECT titulo, preco FROM livro WHERE preco > 40;
SELECT titulo, num_paginas FROM livro WHERE num_paginas <= 200;

-- Entre dois valores (inclui as pontas)
SELECT titulo, num_paginas FROM livro WHERE num_paginas BETWEEN 100 AND 300;

-- Dentro de uma lista
SELECT * FROM livro WHERE id_editora IN (1, 3);

-- Texto parecido: % = qualquer coisa
SELECT titulo FROM livro WHERE titulo LIKE 'O %';      -- começa com "O "
SELECT titulo FROM livro WHERE titulo LIKE '%Brás%';   -- contém "Brás"

-- Campo vazio (NULL não se compara com =)
SELECT nome FROM editora WHERE email IS NULL;
SELECT nome FROM editora WHERE email IS NOT NULL;

-- Combinando condições
SELECT titulo, preco, num_paginas FROM livro
WHERE id_editora = 1 AND preco < 40;

SELECT titulo, preco, num_paginas FROM livro
WHERE preco > 44 OR num_paginas < 100;


-- =====================================================
-- 3. DML: UPDATE (mudar DADOS que já existem)
-- REGRA DE OURO: rode o SELECT com o mesmo WHERE antes!
-- =====================================================

-- Primeiro: confere quem vai ser alterado
SELECT * FROM livro WHERE isbn = '978-85-000-0001-1';

-- Depois: altera só ele
UPDATE livro SET preco = 42.90 WHERE isbn = '978-85-000-0001-1';

-- Preenchendo a coluna nova, livro por livro
UPDATE livro SET ano_publicacao = 1899 WHERE isbn = '978-85-000-0001-1';
UPDATE livro SET ano_publicacao = 1890 WHERE isbn = '978-85-000-0002-8';
UPDATE livro SET ano_publicacao = 1865 WHERE isbn = '978-85-000-0003-5';
UPDATE livro SET ano_publicacao = 1977 WHERE isbn = '978-85-000-0004-2';
UPDATE livro SET ano_publicacao = 1857 WHERE isbn = '978-85-000-0005-9';
UPDATE livro SET ano_publicacao = 1881 WHERE isbn = '978-85-000-0006-6';

-- Várias colunas de uma vez
UPDATE editora
SET email = 'contato@passaro.com', cidade = 'Londrina'
WHERE id_editora = 3;

-- Usando o próprio valor: reajuste de 10% nos livros da editora 2
SELECT titulo, preco FROM livro WHERE id_editora = 2;
UPDATE livro SET preco = preco * 1.10 WHERE id_editora = 2;
SELECT titulo, preco FROM livro WHERE id_editora = 2;

-- PERIGO (não execute): sem WHERE, TODOS os livros mudariam de preço
-- UPDATE livro SET preco = 0;


-- =====================================================
-- 4. DML: DELETE (apagar LINHAS)
-- =====================================================

-- Confere antes
SELECT * FROM copia WHERE isbn = '978-85-000-0001-1' AND num_copia = 2;

-- Apaga só a cópia 2 do Dom Casmurro
DELETE FROM copia WHERE isbn = '978-85-000-0001-1' AND num_copia = 2;

-- Apagar a editora 3 funciona: ela não tem livros
DELETE FROM editora WHERE id_editora = 3;

-- Este DEVE dar erro: a editora 1 tem livros (a FK protege)
DELETE FROM editora WHERE id_editora = 1;


-- =====================================================
-- 5. DELETE x TRUNCATE x DROP (numa tabela de teste!)
-- =====================================================

CREATE TABLE teste (
  id   INT AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(50)
);

INSERT INTO teste (nome) VALUES ('Ana'), ('Bruno'), ('Carla');
SELECT * FROM teste;

-- DELETE sem WHERE: apaga TODAS as linhas, a tabela continua existindo
DELETE FROM teste;
SELECT * FROM teste;     -- vazia, mas existe

INSERT INTO teste (nome) VALUES ('Diego');
SELECT * FROM teste;     -- repare: o id continuou de onde parou (4)

-- TRUNCATE: esvazia a tabela e reinicia o AUTO_INCREMENT
TRUNCATE TABLE teste;
INSERT INTO teste (nome) VALUES ('Fernanda');
SELECT * FROM teste;     -- o id voltou para 1

-- DROP: apaga a TABELA inteira (estrutura + dados). Sem volta.
DROP TABLE teste;
SELECT * FROM teste;     -- erro: a tabela não existe mais

-- Este DEVE dar erro: editora é referenciada por livro (FK)
DROP TABLE editora;

-- Forma segura de escrever em scripts
DROP TABLE IF EXISTS teste;

-- NUNCA rode sem ter certeza (e sem backup):
-- DROP DATABASE biblioteca;
