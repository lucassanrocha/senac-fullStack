-- CREIA TABELA DO FUNCIONARIO

CREATE TABLE Funcionario (
   FCN_Id INT PRIMARY KEY AUTO_INCREMENT,
   FCN_FRQ_Id INT NOT NULL,
   FCN_EST_Id INT NOT NULL,
   FCN_Matricula VARCHAR(99999),
   FCN_Nome VARCHAR(150),
   FCN_CPF CHAR(11) UNIQUE,
   FCN_RG VARCHAR(20) UNIQUE,
   FCN_Data_Nascimento DATE,
   FCN_Email VARCHAR(255) UNIQUE,
   FCN_Celular VARCHAR(20),
   FCN_Senha_Hash VARCHAR(60),
   FCN_Ativo BOOLEAN,
   FOREIGN KEY (FCN_FRQ_Id) REFERENCES franqueado(FRQ_Id),
   Foreign Key (FCN_EST_Id) REFERENCES  estacionamento(EST_Id)
);


-- CREIA TABELA DO ESTACIONAMENTO
CREATE TABLE Estacionamento(
    EST_Id INT PRIMARY KEY AUTO_INCREMENT,
    EST_FRQ_Id INT NOT NULL,
    EST_Nome VARCHAR(150),
    EST_CEP VARCHAR(9),
    EST_Endereco VARCHAR(250),
    EST_Cidade VARCHAR(100),
    EST_Estado VARCHAR(100),
    EST_Imagem_1 VARCHAR(150),
    EST_Imagem_2 VARCHAR(150),
    EST_Imagem_3 VARCHAR(150),
    EST_Latitude DECIMAL ,
    EST_Longitude DECIMAL,
    EST_Horario_Abertura TIME,
    EST_Horario_Fechamento TIME,
    EST_Coberto BOOLEAN,
    EST_Segurança_24h BOOLEAN,
    EST_Status ENUM,
    EST_Aprovado_Em TIMESTAMP,
    Foreign Key (EST_FRQ_Id) REFERENCES franqueado(FRQ_Id)
);