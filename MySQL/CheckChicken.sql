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
        CONSTRAINT fkSensorLote FOREIGN KEY (fkLote) REFERENCES lote(idLote),
        CONSTRAINT fkSensorEmpresa FOREIGN KEY (fkEmpresa) REFERENCES lote(fkEmpresa)
);

CREATE TABLE captura (
	idCaptura INT AUTO_INCREMENT,
	valor DECIMAL(5,2),
	dtMedicao DATETIME,
	fkSensor INT,
    CONSTRAINT pkCapSensor PRIMARY KEY (idCaptura, fkSensor), 
	CONSTRAINT fkCapturaSensor FOREIGN KEY (fkSensor) REFERENCES sensor(idSensor)
);

INSERT INTO parametro VALUES
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
INSERT INTO empresa (nome, cnpj, DDD, prefixo, sufixo, fkEndereco) VALUES
	('Frango Forte Brasil', '12345678901234', '11', '12345', '6789', 1),
	('Corte Certa Aves', '23456789012345', '22', '23456', '7890', 7),
	('Galinha Dourada Ltda', '34567890123456', '33', '34567', '8901', 5),
	('Brasil Frango Vivo', '45678901234567', '44', '45678', '9012', 2),
	('Aves Nobres Brasileiras', '56789012345678', '55', '56789', '0123', 6);

-- Inserindo dados na tabela usuario
INSERT INTO usuario (nome, ddd, prefixo, sufixo, email, senha, fkEmpresa) VALUES
	('João Silva', '11', '98765', '4321', 'joaosilva', 'senha@123', 1),
	('Maria Santos', '11', '98765', '4322', 'mariasantos', 'senha#124', 2),
	('Carlos Pereira', '11', '98765', '4323', 'carlospereira', 'senha@125', 3),
	('Ana Souza', '11', '98765', '4324', 'anasouza', 'senha@126', 4),
	('Pedro Costa', '11', '98765', '4325', 'pedrocosta', 'senha#127', 5);



-- Inserindo dados na tabela lote
INSERT INTO lote (tipo, dtLote, fkParametro, fkEndereco, fkEmpresa) VALUES
	('Embrapa 021', '2024-04-30', 1, null, 1),
	('S-54', '2024-04-23', 2, 7, 2),
	('S-54', '2024-04-16', 3, 2, 4),
	('Chester', '2024-04-09', 4, 3, 3),
	('Embrapa 021', '2024-04-03', 5, 4, 5),
    ('Chester', '2024-03-31', 3, 6, 5),
    ('S-54', '2024-03-27', 5, null, 2);
    
select empresa.idEmpresa, empresa.nome, endereco.idEndereco, lote.tipo from empresa left join endereco on empresa.fkEndereco = idEndereco left join lote on lote.fkEndereco = idEndereco;

-- Inserindo dados na tabela sensor
INSERT INTO sensor (tipo, unidadeMedida, fkLote, fkEmpresa) VALUES
	('DHT-11', '%', 1, 1),
	('LM-35', '°C', 1, 1),
    ('DHT-11', '%', 2, 2),
	('LM-35', '°C', 2, 2),
    ('DHT-11', '%', 3, 4),
	('LM-35', '°C', 3, 4),
    ('DHT-11', '%', 4, 3),
	('LM-35', '°C', 4, 3),
    ('DHT-11', '%', 5, 5),
	('LM-35', '°C', 5, 5),
    ('DHT-11', '%', 6, 5),
	('LM-35', '°C', 6, 5),
    ('DHT-11', '%', 7, 2),
	('LM-35', '°C', 7, 2);

-- Inserindo dados na tabela captura
/* 
	INSERT INTO captura (valor, dtMedicao, fkSensor) VALUES
	(65, '2024-05-06 22:00:00', 1),
    (30, '2024-05-06 22:00:00', 2),
	(61, '2024-05-06 22:00:00', 3),
    (31, '2024-05-06 22:00:00', 4),
	(60.3, '2024-05-06 22:00:00', 5),
	(28.6, '2024-05-06 22:00:00', 6),
	(68, '2024-05-06 22:00:00', 7),
	(25, '2024-05-06 22:00:00', 8),
	(69.7, '2024-05-06 22:00:00', 9),
	(21, '2024-05-06 22:00:00', 10),
    (59.4, '2024-05-06 22:00:00', 11),
    (20.7, '2024-05-06 22:00:00', 12),
    (71, '2024-05-06 22:00:00', 13),
    (22.2, '2024-05-06 22:00:00', 14);
*/

SELECT * FROM parametro;
SELECT * FROM empresa;
SELECT * FROM usuario;
SELECT * FROM endereco;
SELECT * FROM lote;
SELECT * FROM sensor;
SELECT * FROM captura;

SELECT sensor.tipo, l.tipo, l.dtLote, tempMinIdeal, tempMaxIdeal, umidadeMinIdeal, umidadeMaxIdeal, valor, unidadeMedida, dtMedicao FROM lote AS l
	JOIN parametro ON DATEDIFF(CURRENT_DATE(), dtLote) >= diaMin
    AND DATEDIFF(CURRENT_DATE(), dtLote) <= diaMax
    JOIN sensor ON fkLote = idLote
    JOIN captura ON fkSensor = idSensor;

SELECT avg(valor) AS mediaTemp FROM captura JOIN sensor ON idSensor = fkSensor JOIN lote ON idLote = fkLote WHERE idLote = 1 AND unidadeMedida = '%' AND dtMedicao = now();
SELECT avg(valor) AS mediaTemp FROM captura JOIN sensor ON idSensor = fkSensor JOIN lote ON idLote = fkLote WHERE idLote = 1 AND unidadeMedida = '°C';

/*
INSERT INTO captura (valor, dtMedicao, idSensor) VALUES
	(0, now(), 0);
*/
    
SELECT * FROM lote join empresa on fkEmpresa = idEmpresa;

SELECT now();

SELECT round(avg(valor), 2) AS mediaTemperatura FROM captura WHERE fkSensor = (SELECT idSensor FROM sensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa WHERE idEmpresa = 1 AND sensor.unidadeMedida = '°C' AND idLote = 1);

SELECT valor, dtMedicao, (SELECT round(avg(valor), 2) FROM captura 
                        WHERE fkSensor = (SELECT idSensor FROM sensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa
                                            WHERE idEmpresa = 1 AND sensor.unidadeMedida = '°C' AND idLote = 1 AND dtMedicao = now())) AS MediaTempLote
FROM captura JOIN sensor ON idSensor = fkSensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa
WHERE idEmpresa = 1 AND sensor.unidadeMedida = '°C' AND idLote = 1 ORDER BY idCaptura DESC LIMIT 12;

SELECT valor, dtMedicao, (SELECT round(avg(valor), 2) FROM captura 
                        WHERE fkSensor = (SELECT idSensor FROM sensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa
                                            WHERE idEmpresa = 1 AND sensor.unidadeMedida = '%' AND idLote = 1 AND dtMedicao = now())) AS MediaTempLote
FROM captura JOIN sensor ON idSensor = fkSensor JOIN lote ON idLote = fkLote JOIN empresa ON idEmpresa = lote.fkEmpresa
WHERE idEmpresa = 1 AND sensor.unidadeMedida = '%' AND idLote = 1 ORDER BY idCaptura DESC LIMIT 12;