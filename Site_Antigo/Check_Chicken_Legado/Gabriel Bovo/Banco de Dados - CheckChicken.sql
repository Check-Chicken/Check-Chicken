USE sprint1;

-- Tela de Login
CREATE TABLE tela_login (
	idIncial INT PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(120),
	senha VARCHAR(250)
    );

INSERT INTO tela_login VALUES
	(default,'diogo.doe@outlook.com','P@ssw0rd123'),
	(default,'caio.smith@hotmail.com','BlueSky789'),
	(default,'gabriel.jackson@gmail.com','FireDragon456#'),
	(default,'emily.timoteo@outlook.com','Sunshine!23'),
	(default,'david.miller@gmail.com','OceanWave987');
 
 SELECT * FROM tela_login;

-- Tela cadastro 1
CREATE TABLE tela_cadastro1 (
	idCadastro1 INT PRIMARY KEY AUTO_INCREMENT,
    nome_produtor VARCHAR(45),
    dtNascimento DATE,
    cpf CHAR(11) NOT NULL,
    rg CHAR(10),
    telefone CHAR(11),
    email VARCHAR(60) NOT NULL,
    senha VARCHAR(100) NOT NULL
    );
    
INSERT INTO tela_cadastro1 VALUES
	(default,'Diogo Polastrine','1985-05-12','12345678901','123456789','11987654321','diogo.doe@outlook.com','P@ssw0rd123'),
	(default,'Caio Smith','1990-09-25','23456789012','234567890','11976543210','caio.smith@hotmail.com','BlueSky789'),
	(default,'Gabriel Jackson','1980-03-08','34567890123','345678901','11965432109','gabriel.jackson@gmail.com','FireDragon456#'),
	(default,'Emily Timoteo','1976-11-15','45678901234','456789012','11954321098','emily.timoteo@outlook.com','Sunshine!23'),
	(default,'David Miller','1988-07-02','56789012345','567890123','11943210987','david.miller@gmail.com','OceanWave987');

SELECT * FROM tela_cadastro1;
    
-- Tela de cadastro 2
CREATE TABLE tela_cadastro2 (
	idCadastro2 INT PRIMARY KEY AUTO_INCREMENT,
    cnpj CHAR(14) NOT NULL,
    nome_empresa VARCHAR(150),
    nome_fantasia VARCHAR(150),
    cep CHAR(8),
    logadouro VARCHAR(150),
    numeroLogradouro int,
    estado VARCHAR(45),
    cidade VARCHAR(45));
    
INSERT INTO tela_cadastro2 VALUES
    (default,'12345678901234', 'Empresa ABC LTDA', 'ABC Distribuidora', '12345678', 'Rua Principal', 123, 'São Paulo', 'São Paulo'),
	(default,'23456789012345', 'Frango Assado LTDA', 'X Franguinho', '23456789', 'Avenida Central', 456, 'Rio de Janeiro', 'Rio de Janeiro'),
	(default,'34567890123456', 'Frango Dourado Distribuidora Ltda', 'FDourado', '34567890', 'Rua da Praça', 789, 'Minas Gerais', 'Belo Horizonte'),
	(default,'45678901234567', 'Asas de Ouro Frangos Ltda', 'Asas de Ouro Frangos', '45678901', 'Rua das Flores', 1011, 'Paraná', 'Curitiba'),
	(default,'56789012345678', 'Penas & Penugem Frangos Ltda', 'Penas Chicken', '56789012', 'Avenida das Palmeiras', 1213, 'Bahia', 'Salvador');

 SELECT * FROM tela_cadastro2;
 
-- Banco de dados para captação do sensor

CREATE TABLE sensor(
	idReceptor INT PRIMARY KEY,
    lote VARCHAR(100),
    temperatura VARCHAR(40),
    umidade VARCHAR(40)
    );
    
ALTER TABLE sensor MODIFY COLUMN umidade VARCHAR(20);

INSERT INTO sensor VALUES
	(1, 'LoteA123', '25°C', '50%'),
	(2, 'LoteB456', '22°C', '55%'),
	(3, 'LoteC789', '28°C', '60%'),
	(4, 'LoteD012', '20°C', '45%'),
	(5, 'LoteE345', '23°C', '52%');
    
SELECT * FROM sensor;
    
    



    
    
    