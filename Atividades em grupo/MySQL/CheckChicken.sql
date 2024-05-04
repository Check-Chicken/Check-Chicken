CREATE DATABASE CheckChicken;
USE CheckChicken;

CREATE TABLE parametros (
	idParametros INT PRIMARY KEY AUTO_INCREMENT,
    diaMin INT,
    diaMax INT,
    tempMin INT,
    tempMax INT,
    umidadeMin INT,
    umidadeMax INT,
    avisoTemperatura DECIMAL (4,2),
    avisoUmidade DECIMAL (4,2)
);

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
    dtMedicao DATETIME,
    fkEndereco INT,
    fkLote INT,
    fkEmpresa INT,
		CONSTRAINT pkSensorEmpresa PRIMARY KEY (idSensor, fkEndereco, fkEmpresa),
        CONSTRAINT fkSensorEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco),
        CONSTRAINT FkSensorLote FOREIGN KEY (fkLote) REFERENCES lote(idLote),
		CONSTRAINT fkSensorEmpresa FOREIGN KEY (fkEmpresaLote) REFERENCES empresa(idEmpresa)
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
