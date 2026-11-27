CREATE DATABASE lanchonete;

USE lanchonete;

CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(190) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    created_at TIMESTAMP
);

CREATE Table IF NOT EXISTS produtos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2),
    qtd INT NOT NULL DEFAULT 0,
    categoria VARCHAR(50) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

INSERT INTO
    usuarios (nome, email, senha)
VALUES ('Admin','admin@admin.com', 123456),
    ('lucas', 'lucas@gmail.com ', 123456),
    ( 'joao', 'joao@joao.com',  123456);

iNSERT INTO
    produtos (nome, preco, qtd, categoria)
VALUES (   'Coca-Cola', 5.00, 10, 'Bebidas' ),
    ( 'X-Burguer', 15.00,  5, 'Lanches'  ),
    (  'Batata Frita',  7.00,  20,  'Acompanhamentos');

    SELECT * FROM usuarios;
    SELECT * FROM produtos;

    SHOW TABLES;

    DESCRIBE usuarios;
    DESCRIBE produtos;