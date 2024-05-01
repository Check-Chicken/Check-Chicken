CREATE DATABASE CheckChicken;
USE CheckChicken;

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	cnpj CHAR(14),
	DDD CHAR(2),
    prefixo CHAR(5),
    sufixo CHAR(4)
);

CREATE TABLE endereco (
	idEnd INT AUTO_INCREMENT,
    cep CHAR (9),
    complemento VARCHAR(45),
    numero VARCHAR(10),
    fkEmpresa INT,
    CONSTRAINT PkEndEmpresa PRIMARY KEY (idEnd, fkEmpresa),
	CONSTRAINT FkEndEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE parametro (
	idParametro INT PRIMARY KEY AUTO_INCREMENT,
	idade VARCHAR(3),
	tempMax INT,
	tempMin INT,
	umidadeMax INT,
	umidadeMin INT
);

CREATE TABLE lote (
	idLote INT AUTO_INCREMENT,
	tipo VARCHAR(20),
	dtLote DATE,
	fkEndereco INT,
    fkEmpresa INT,
		CONSTRAINT PkLoteEndereco PRIMARY KEY (idLote, fkEndereco, fkEmpresa),
		CONSTRAINT FkLoteEmpresaEndereco FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
        CONSTRAINT fkLoteEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco),
	fkParametro INT,
		CONSTRAINT FkAviarioParametros FOREIGN KEY (fkParametro) REFERENCES parametro(idParametro)
);

CREATE TABLE sensor (
	idSensor INT AUTO_INCREMENT,
    tempAtual DECIMAL(5, 2),
    umidadeAtual INT,
    data DATETIME,
    tempMaxDia DECIMAL(5, 2),
    tempMinDia DECIMAL(5, 2),
    umidadeMaxDia INT,
    umidadeMinDia INT,
    fkAviario INT, CONSTRAINT FkSensorAviario FOREIGN KEY (fkAviario) REFERENCES aviario(idAviario),
    fkEmpresaAviario INT,
		CONSTRAINT PkSensorEmpresa PRIMARY KEY (idSensor, fkEmpresaAviario),
		CONSTRAINT FkSensorEmpresa FOREIGN KEY (fkEmpresaAviario) REFERENCES empresa(idEmpresa)
);

CREATE TABLE usuario (
	idUsuario INT AUTO_INCREMENT,
	nome VARCHAR(45),
	telefoneCelular VARCHAR(11),
	usuario VARCHAR(45),
	senha VARCHAR(45),
	fkEmpresa INT,
		CONSTRAINT PkUsuarioEmpresa PRIMARY KEY (idUsuario, fkEmpresa),
        CONSTRAINT FkUsuarioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

