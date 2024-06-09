CREATE DATABASE checkchicken;
USE checkchicken;

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
	cep CHAR(8) NOT NULL,
	rua VARCHAR(45) NOT NULL,
	bairro VARCHAR(45) NOT NULL,
	cidade VARCHAR(45) NOT NULL,
	estado CHAR(2) NOT NULL,
		CONSTRAINT ChkEstado CHECK (estado IN('AC', 'AL', 'AP', 'AM', 'BA', 'CE', 'DF', 'ES', 'GO', 'MA', 'MT', 'MS', 'MG', 'PA', 'PB', 'PR', 'PE', 'PI', 'RJ', 'RN', 'RS', 'RO', 'RR', 'SC', 'SP', 'SE', 'TO')),
	numero CHAR(8) NOT NULL
);

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	cnpj CHAR(11),
    nome VARCHAR(45),
    responsavel VARCHAR(45),
    fkEndereco INT,
		CONSTRAINT fkEmpresaEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco)
);

CREATE TABLE aviario (
	idAviario INT PRIMARY KEY AUTO_INCREMENT,
    temperatura INT,
    umidade INT,
    fkEmpresa INT,
		CONSTRAINT fkAviarioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

INSERT INTO endereco (cep, rua, bairro, cidade, estado, numero) VALUES
	('05167483', 'Rua dos sonhos felizes', 'Povo Alegre', 'São Paulo', 'SP', '502'),
	('05167484', 'Rua Dom Quixote', 'Nilo Macedo', 'Anubis', 'RS', '52');

INSERT INTO empresa (cnpj, nome, responsavel, fkEndereco) VALUES
	('01234567890', 'Tramontina', 'Carlos Tramontina', 1),
	('01234567891', 'Carnes e Frangos', 'João Frango', 2);
    
INSERT INTO aviario (temperatura, umidade, fkEmpresa) VALUES
	(30, 33, 1),
	(24, 80, 1),
	(28, 60, 2);

SELECT * FROM endereco JOIN empresa ON fkEndereco = idEndereco JOIN aviario ON fkEmpresa = idEmpresa;