--CREIANDO O BANCO DE DADOS
CREATE DATABASE biblioteca;

-- escolhe o banco de dados que vamos trabalhar / roda apenas biblioteca
USE biblioteca;

-- CRIANDO TABLETAS

--  Tabelas SEM chave estrangeiras (FK) primeiro
CREATE TABLE editora(
    id_editora INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    rua VARCHAR(150),
    numero VARCHAR(10),
    cidade VARCHAR(100), -- VARCHAR seria o string
    up CHAR(2),          -- CHAR caracteres fixas
    cep CHAR(9), 
    email VARCHAR(100)    
);


CREATE TABLE autor(
    id_autor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);


-- Criando Tabela com Chave estrangeiras(FK)

CREATE TABLE livro (
    isbn VARCHAR(17) PRIMARY KEY,
    titulo VARCHAR(140) NOT NULL,
    numero_paginas INT,
    preço DECIMAL(10,2),
    id_editora INT NOT NULL,
    FOREIGN KEY (id_editora) REFERENCES editora (id_editora)
);

CREATE TABLE copia (
    isbn VARCHAR(17),
    numero_copia INT,
    data_aquisicao DATE,
    PRIMARY KEY (isbn, numero_copia),
    FOREIGN KEY (isbn) REFERENCES livro(isbn)
);

CREATE TABLE livro_autor(
    isbn VARCHAR(17),
    id_autor INT,
    PRIMARY KEY (isbn, id_autor),
    FOREIGN KEY (isbn) REFERENCES livro(isbn),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

CREATE Table autor_formacao (
    id_autor INT,
    formacao VARCHAR(80),
    PRIMARY KEY (id_autor, formacao),
    FOREIGN KEY (id_autor) REFERENCES autor(id_autor)
);

-- Coferir o banco / o que foi criado

SHOW TABLES;

DESCRIBE autor;

-- 1. DDL: ALTER TABLE (mudar ESTRUTURA)
-- adicionar uma coluna
ALTER TABLE livro ADD COLUMN ano_publicacao INT;

SELECT * FROM livro;


-- mudar o tipo ou as regras de uma coluna

ALTER TABLE livro MODIFY titulo VARCHAR(200) NOT NULL;

-- renomear uma coluna (nome antigo , nome novo , tipo)
ALTER TABLE livro CHANGE COLUMN num_paginas numero_paginas INT;

-- Remover uma coluna (os dados dela somem junto!)
ALTER TABLE livro DROP COLUMN ano_publicacao;

-- 2. DML: UPDATE (mudar DADOS que ja existem)

SELECT * FROM livro ;


INSERT INTO livro (isbn, titulo,numero_paginas, preço, id_editora)
VALUES('978-85-000-0001-1','Dom Casmurro', 256 , 39.90, 1);

SHOW CREATE TABLE livro;
SHOW CREATE TABLE editora;
SELECT * FROM editora;