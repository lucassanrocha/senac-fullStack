CREATE DATABASE escola;

USE escola;

CREATE TABLE alunos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    curso VARCHAR(50)
);

INSERT INTO alunos(nome,idade,curso)
VALUES('Lucas',30, 'ADM'),('Maria', 20, 'Informatica'),('José', 40, 'Desing')

SELECT * FROM alunos;

SELECT nome , curso FROM alunos;

SELECT * FROM alunos WHERE curso = 'Informatica';


SELECT * FROM alunos WHERE idade > 18;