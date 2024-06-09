CREATE DATABASE CheckChicken;
USE CheckChicken;

CREATE TABLE parametro (
	idParametro INT PRIMARY KEY AUTO_INCREMENT,
    diaMin INT,
    diaMax INT,
    tempMinIdeal INT,
    tempMaxIdeal INT,
    umidadeMinIdeal INT,
    umidadeMaxIdeal INT,
    avisoTemperaturaMax DECIMAL(5,2),
    avisoTemperaturaMin DECIMAL(5,2),
    avisoUmidadeMax DECIMAL(5,2),
    avisoUmidadeMin DECIMAL(5,2)
);

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR (9),
    complemento VARCHAR(45),
    numero VARCHAR(10)
);

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	cnpj CHAR(14),
	DDD CHAR(2),
    prefixo CHAR(5),
    sufixo CHAR(4),
    fkEndereco int,
    constraint fkEnderecoEmpresa foreign key (fkEndereco) references endereco (idEndereco)
);

CREATE TABLE usuario (
	idUsuario INT AUTO_INCREMENT,
	nome VARCHAR(45),
	ddd CHAR(2),
    prefixo CHAR(5),
    sufixo CHAR(4),
	email VARCHAR(200),
	senha VARCHAR(45),
	fkEmpresa INT,
		CONSTRAINT pkUsuarioEmpresa PRIMARY KEY (idUsuario, fkEmpresa),
        CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa)
);

CREATE TABLE lote (
	idLote INT AUTO_INCREMENT,
	tipo VARCHAR(20),
	dtLote DATE,
    fkEmpresa INT,
	fkParametro INT,
	fkEndereco INT,
		CONSTRAINT PkLoteEndereco PRIMARY KEY (idLote, fkEmpresa),
        CONSTRAINT fkLoteEmpresa FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
        CONSTRAINT fkLoteParametro FOREIGN KEY (fkParametro) REFERENCES parametro(idParametro),
        CONSTRAINT fkLoteEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco)
);

CREATE TABLE sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(45),
    unidadeMedida VARCHAR(45),
    CONSTRAINT chkUnidadeMedida CHECK (unidadeMedida in ('°C', '%')), 
    fkLote INT,
    fkEmpresa INT,
        CONSTRAINT fkSensorLote FOREIGN KEY (fkLote) REFERENCES Lote(idLote),
        CONSTRAINT fkSensorEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Lote(fkEmpresa)
);

CREATE TABLE captura (
	idCaptura INT AUTO_INCREMENT,
	valor DECIMAL(5,2),
	dtMedicao DATETIME,
	fkSensor INT,
    CONSTRAINT pkCapSensor PRIMARY KEY (idCaptura, fkSensor), 
	CONSTRAINT fkCapturaSensor FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor)
);
