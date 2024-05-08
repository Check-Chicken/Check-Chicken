DROP DATABASE CheckChicken;
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
    avisoTemperaturaMax DECIMAL (4,2),
    avisoTemperaturaMin DECIMAL (4,2),
    avisoUmidadeMax DECIMAL (4,2),
    avisoUmidadeMin DECIMAL (4,2)
);

CREATE TABLE empresa (
	idEmpresa INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(45),
	cnpj CHAR(14),
	DDD CHAR(2),
    prefixo CHAR(5),
    sufixo CHAR(4)
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

CREATE TABLE endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT,
    cep CHAR (9),
    complemento VARCHAR(45),
    numero VARCHAR(10)
);

CREATE TABLE lote (
	idLote INT AUTO_INCREMENT,
	tipo VARCHAR(20),
	dtLote DATE,
	fkParametro INT,
	fkEndereco INT,
    fkEmpresa INT,
		CONSTRAINT PkLoteEndereco PRIMARY KEY (idLote, fkEndereco, fkEmpresa),
        CONSTRAINT FkAviarioParametro FOREIGN KEY (fkParametro) REFERENCES parametro(idParametro),
		CONSTRAINT FkLoteEmpresaEndereco FOREIGN KEY (fkEmpresa) REFERENCES empresa(idEmpresa),
        CONSTRAINT fkLoteEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco)
);

CREATE TABLE sensor (
	idSensor INT AUTO_INCREMENT,
    tempAtual DECIMAL(5, 2),
    umidadeAtual INT,
    dtMedicao DATETIME,
    fkLote INT,
    fkEndereco INT,
    fkEmpresa INT,
		CONSTRAINT pkSensorEmpresa PRIMARY KEY (idSensor, fkLote, fkEndereco, fkEmpresa),
        CONSTRAINT FkSensorLote FOREIGN KEY (fkLote) REFERENCES lote(idLote),
        CONSTRAINT fkSensorEndereco FOREIGN KEY (fkEndereco) REFERENCES Lote(fkEndereco),
		CONSTRAINT fkSensorEmpresa FOREIGN KEY (fkEmpresa) REFERENCES Lote(fkEmpresa)
);


INSERT INTO Parametro VALUES
	(DEFAULT, 1, 7, 31, 35, 60, 70, 32.00, 34.00, 57, 65),
	(DEFAULT, 8, 14, 29, 32, 60, 70, 30.00, 31.45, 57, 65),
	(DEFAULT, 15, 21, 26, 29, 60, 70, 26.70, 28.50, 57, 65),
	(DEFAULT, 22, 28, 23, 26, 60, 70, 24.30, 25.30, 57, 65),
	(DEFAULT, 28, 90, 20, 23, 60, 70, 21.30, 22.40, 57, 65);


-- Inserindo dados na tabela empresa
INSERT INTO empresa (nome, cnpj, DDD, prefixo, sufixo) VALUES
	('Frango Forte Brasil', '12345678901234', '11', '12345', '6789'),
	('Corte Certa Aves', '23456789012345', '22', '23456', '7890'),
	('Galinha Dourada Ltda', '34567890123456', '33', '34567', '8901'),
	('Brasil Frango Vivo', '45678901234567', '44', '45678', '9012'),
	('Aves Nobres Brasileiras', '56789012345678', '55', '56789', '0123');

-- Inserindo dados na tabela usuario
INSERT INTO usuario (nome, telefoneCelular, usuario, senha, fkEmpresa) VALUES
	('João Silva', '11987654321', 'joaosilva', 'senha@123', 1),
	('Maria Santos', '11987654322', 'mariasantos', 'senha#124', 2),
	('Carlos Pereira', '11987654323', 'carlospereira', 'senha@125', 3),
	('Ana Souza', '11987654324', 'anasouza', 'senha@126', 4),
	('Pedro Costa', '11987654325', 'pedrocosta', 'senha#127', 5);

-- Inserindo dados na tabela endereco
INSERT INTO endereco (cep, complemento, numero) VALUES
	('12345-678', 'Rua das Pardas', '100'),
	('23456-789', 'Rua Angolana', '200'),
	('34567-890', 'Rua Sussex', '300'),
	('45678-901', 'Rua Legorne', '400'),
	('56789-012', 'Rua Sedosa', '500');

-- Inserindo dados na tabela lote
INSERT INTO lote (tipo, dtLote, fkParametro, fkEndereco, fkEmpresa) VALUES
	('Embrapa 021', '2024-04-30', 1, 1, 1),
	('S-54', '2024-04-23', 2, 2, 1),
	('S-54', '2024-04-16', 3, 3, 2),
	('Chester', '2024-04-09', 4, 4, 3),
	('Embrapa 021', '2024-04-03', 5, 5, 3),
    ('Chester', '2024-03-31', 3, 2, 4),
    ('S-54', '2024-03-27', 5, 1, 5);

-- Inserindo dados na tabela sensor
INSERT INTO sensor (tempAtual, umidadeAtual, dtMedicao, fkLote, fkEndereco, fkEmpresa) VALUES
	(30, 65, '2024-05-06 22:00:00', 1, 1, 1),
	(31, 61, '2024-05-06 22:00:00', 2, 2, 1),
	(28.6, 60.3, '2024-05-06 22:00:00', 3, 3, 2),
	(25, 68, '2024-05-06 22:00:00', 4, 4, 3),
	(21, 69.7, '2024-05-06 22:00:00', 5, 5, 3),
    (20.7, 59.4, '2024-05-06 22:00:00', 6, 2, 4),
    (22.2, 71, '2024-05-06 22:00:00', 7, 1, 5);

SELECT * FROM Parametro;
SELECT * FROM Empresa;
SELECT * FROM Usuario;
SELECT * FROM Endereco;
SELECT * FROM Lote;
SELECT * FROM Sensor;

SELECT l.tipo, l.dtLote, tempMinIdeal, tempMaxIdeal, umidadeMinIdeal, umidadeMaxIdeal, tempAtual, umidadeAtual FROM Lote AS l
	JOIN Parametro ON DATEDIFF(CURRENT_DATE(), dtLote) >= diaMin
    AND DATEDIFF(CURRENT_DATE(), dtLote) <= diaMax
    JOIN sensor ON fkLote = idLote;