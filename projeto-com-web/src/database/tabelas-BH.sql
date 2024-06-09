CREATE DATABASE BlueHorizon;

USE BlueHorizon;


CREATE TABLE usuario(
	idUsuario INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(50),
    CPF CHAR(11),
	email VARCHAR(50) UNIQUE,
	senha VARCHAR(50),
    fkQuiz INT NULL,
    FOREIGN KEY (fkQuiz) REFERENCES quiz (idQuiz),
    DT_CRIACAO TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM usuario;

-- truncate table usuario;
CREATE TABLE quiz(
	idQuiz INT PRIMARY KEY AUTO_INCREMENT,
    numeroPergunta INT,
    textoPergunta VARCHAR(200),
    resposta VARCHAR(200),
    pontuacao INT
    );
    
CREATE TABLE pontuacao(
  idPontuacao INT AUTO_INCREMENT PRIMARY KEY,
  qtdPontos INT NOT NULL,
  data TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  fkUsuario int,
  constraint chkUsuario foreign key(fkUsuario) references usuario (idUsuario)
);

select * from pontuacao;

SELECT usuario.*, p.*
    FROM usuario JOIN (
    SELECT fkUsuario, MAX(qtdPontos) AS max_score
    FROM pontuacao as p
    GROUP BY fkUsuario ) 
    pm ON usuario.idUsuario = pm.fkUsuario
    JOIN pontuacao p ON p.fkUsuario = pm.fkUsuario AND p.qtdPontos = pm.max_score
    WHERE p.idPontuacao IN (
    SELECT MIN(pontuacao2.idPontuacao)
    FROM pontuacao as pontuacao2 JOIN (
    SELECT fkUsuario, MAX(qtdPontos) AS max_score
    FROM pontuacao as pontuacao3 GROUP BY fkUsuario
    ) pontuacao3 ON pontuacao2.fkUsuario = pontuacao3.fkUsuario AND pontuacao2.qtdPontos = pontuacao3.max_score
    GROUP BY pontuacao2.fkUsuario
    ) ORDER BY pm.max_score DESC LIMIT 10;

-- drop table pontuacao;
    