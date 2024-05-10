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
    email varchar(200),
    senha varchar(45),
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
	fkParametro INT,
	fkEndereco INT,
		CONSTRAINT PkLoteEndereco PRIMARY KEY (idLote, fkEndereco),
        CONSTRAINT fkLoteParametro FOREIGN KEY (fkParametro) REFERENCES parametro(idParametro),
        CONSTRAINT fkLoteEndereco FOREIGN KEY (fkEndereco) REFERENCES endereco(idEndereco)
);

CREATE TABLE Sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(45),
    unidadeMedida VARCHAR(45), 
    qtdSensor INT,
    CONSTRAINT chkUnidadeMedida CHECK (unidadeMedida in ('graus Celsius', '%')), 
    fkLote INT,
    fkEndereco INT,
        CONSTRAINT fkSensorLote FOREIGN KEY (fkLote) REFERENCES Lote(idLote),
        CONSTRAINT fkSensorEndereco FOREIGN KEY (fkEndereco) REFERENCES Lote(fkEndereco)
);

CREATE TABLE CapturaMedia (
	idCaptura INT PRIMARY KEY AUTO_INCREMENT,
	valor DECIMAL(5,2),
	dtMedicao DATETIME,
	fkSensor INT,
		CONSTRAINT fkCapturaSensor FOREIGN KEY (fkSensor) REFERENCES Sensor(idSensor)
);

INSERT INTO Parametro VALUES
	(DEFAULT, 1, 7, 31, 35, 60, 70, 34.00, 32.00,   65, 57),
	(DEFAULT, 8, 14, 29, 32, 60, 70, 31.45, 30.00,  65, 57),
	(DEFAULT, 15, 21, 26, 29, 60, 70, 28.50, 26.70, 65, 57),
	(DEFAULT, 22, 28, 23, 26, 60, 70, 25.30, 24.30, 65, 57),
	(DEFAULT, 28, 90, 20, 23, 60, 70, 22.40, 21.30, 65, 57);

-- Inserindo dados na tabela endereco
INSERT INTO endereco (cep, complemento, numero) VALUES
	('12345-678', 'Rua das Pardas', '100'),
	('23456-789', 'Rua Angolana', '200'),
	('34567-890', 'Rua Sussex', '300'),
	('45678-901', 'Rua Legorne', '400'),
    ('56789-012', 'Rua Australorp', '500'),
	('45678-902', 'Rua Menorquina', '600'),
	('45678-903', 'Rua Marans', '700');

-- Inserindo dados na tabela empresa
INSERT INTO empresa (nome, cnpj, DDD, prefixo, sufixo, email, senha, fkEndereco) VALUES
	('Frango Forte Brasil', '12345678901234', '11', '12345', '6789', 'frango.forte@gmail.com', 'Megamani@3309', 1),
	('Corte Certa Aves', '23456789012345', '22', '23456', '7890', 'corte.aves@gmail.com', 'G@linhasCorte2024', 7),
	('Galinha Dourada Ltda', '34567890123456', '33', '34567', '8901', 'g@linha.ltda@gmail.com', 'Dourada@LTDA2024', 5),
	('Brasil Frango Vivo', '45678901234567', '44', '45678', '9012', 'frango.vivo@gmail.com', 'VivoFrango@2024', 2),
	('Aves Nobres Brasileiras', '56789012345678', '55', '56789', '0123', 'aves.nobres@gmail.com', 'Nobres@ves2025', 6);

-- Inserindo dados na tabela usuario
INSERT INTO usuario (nome, telefoneCelular, email, senha, fkEmpresa) VALUES
	('João Silva', '11987654321', 'joaosilva', 'senha@123', 1),
	('Maria Santos', '11987654322', 'mariasantos', 'senha#124', 2),
	('Carlos Pereira', '11987654323', 'carlospereira', 'senha@125', 3),
	('Ana Souza', '11987654324', 'anasouza', 'senha@126', 4),
	('Pedro Costa', '11987654325', 'pedrocosta', 'senha#127', 5);



-- Inserindo dados na tabela lote
INSERT INTO lote (tipo, dtLote, fkParametro, fkEndereco) VALUES
	('Embrapa 021', '2024-04-30', 1, 1),
	('S-54', '2024-04-23', 2, 2),
	('S-54', '2024-04-16', 3, 3),
	('Chester', '2024-04-09', 4, 4),
	('Embrapa 021', '2024-04-03', 5, 5),
    ('Chester', '2024-03-31', 3, 1),
    ('S-54', '2024-03-27', 5, 2);

-- Inserindo dados na tabela sensor
INSERT INTO Sensor (tipo, unidadeMedida, qtdSensor, fkLote, fkEndereco) VALUES
	('DHT-11', '%', 2, 1, 1),
	('LM-35', 'graus Celsius', 2, 1, 1),
    ('DHT-11', '%', 3, 2, 2),
	('LM-35', 'graus Celsius', 2, 2, 2),
    ('DHT-11', '%', 2, 3, 3),
	('LM-35', 'graus Celsius', 3, 3, 3),
    ('DHT-11', '%', 1, 4, 4),
	('LM-35', 'graus Celsius', 1, 4, 4),
    ('DHT-11', '%', 1, 5, 5),
	('LM-35', 'graus Celsius', 2, 5, 5),
    ('DHT-11', '%', 2, 6, 1),
	('LM-35', 'graus Celsius', 2, 6, 1),
    ('DHT-11', '%', 1, 7, 2),
	('LM-35', 'graus Celsius', 1, 7, 2);

-- Inserindo dados na tabela captura
INSERT INTO capturaMedia (valor, dtMedicao, fkSensor) VALUES
	(30, '2024-05-06 22:00:00', 1),
    (65, '2024-05-06 22:00:00', 2),
	(31, '2024-05-06 22:00:00', 3),
    (61, '2024-05-06 22:00:00', 4),
	(28.6, '2024-05-06 22:00:00', 5),
	(60.3, '2024-05-06 22:00:00', 6),
	(25, '2024-05-06 22:00:00', 7),
	(68, '2024-05-06 22:00:00', 8),
	(21, '2024-05-06 22:00:00', 9),
	(69.7, '2024-05-06 22:00:00', 10),
    (20.7, '2024-05-06 22:00:00', 11),
    (59.4, '2024-05-06 22:00:00', 12),
    (22.2, '2024-05-06 22:00:00', 13),
    (71, '2024-05-06 22:00:00', 14);

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