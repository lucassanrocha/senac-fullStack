-- Conecta Tech

CREATE DATABASE conectatech;
 
USE conectatech;

CREATE TABLE cliente(
  id_cliente  INT PRIMARY KEY  NOT NULL AUTO_INCREMENT,
  nome        VARCHAR(100) NOT NULL,
  email       VARCHAR(100) NOT NULL,
  rua         VARCHAR(100),
  numero      VARCHAR(10),               
  cidade      VARCHAR(60),
  uf          CHAR(2),
  cep         VARCHAR(9)                                       
);

CREATE TABLE categoria (
  id_categoria INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nome         VARCHAR(60) NOT NULL                
);

CREATE TABLE cliente_telefone (
  id_cliente INT         NOT NULL,
  telefone   VARCHAR(20) NOT NULL,       
  PRIMARY KEY (id_cliente, telefone),
  FOREIGN KEY (id_cliente)
  REFERENCES cliente(id_cliente)
);

CREATE TABLE produto (
  id_produto   INT NOT NULL AUTO_INCREMENT,
  nome         VARCHAR(100)  NOT NULL,
  preco_atual  DECIMAL(10,2) NOT NULL,
  id_categoria INT           NOT NULL,
  PRIMARY KEY (id_produto),
  FOREIGN KEY (id_categoria)
    REFERENCES categoria(id_categoria)
) ENGINE=InnoDB;

CREATE TABLE pedido (
  num_pedido       INT  NOT NULL AUTO_INCREMENT,
  data             DATE  NOT NULL,          
  situacao         VARCHAR(20)  NOT NULL DEFAULT 'Pendente',
  observacao       VARCHAR(255),
  forma_pagamento  VARCHAR(30)  NOT NULL,
  rua_entrega      VARCHAR(100),
  numero_entrega   VARCHAR(10),                    
  cidade_entrega   VARCHAR(60),
  cep_entrega      VARCHAR(9),                    
  id_cliente       INT          NOT NULL,
  PRIMARY KEY (num_pedido),
  FOREIGN KEY (id_cliente)
  REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido (
  num_pedido     INT           NOT NULL,
  id_produto     INT           NOT NULL,
  quantidade     INT           NOT NULL,
  preco_unitario DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (num_pedido, id_produto),
  FOREIGN KEY (num_pedido)
  REFERENCES pedido(num_pedido),
  FOREIGN KEY (id_produto)
  REFERENCES produto(id_produto)
);

SHOW TABLES;
