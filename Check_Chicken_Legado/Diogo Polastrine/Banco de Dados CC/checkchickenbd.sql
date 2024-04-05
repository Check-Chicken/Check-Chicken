CREATE DATABASE checkchicken;
USE checkchicken;

-- Tabela de Cadastro 1 (Cadastro de usuário) --------------------------------------------

CREATE TABLE usuario (
idUsuario int primary key auto_increment,
nome varchar(40),
dtNasc date,
cpf char(11) not null,
rg char(9) not null,
telefone varchar(12),
email varchar(45),
senha varchar(16)
);

-- Inserção de valores, Botão CONCLUIR:
INSERT INTO usuario VALUES 
	(default, 'Renato Fernandes do Nascimento', '1990-11-11','19286476367','438310965', '1190463-0665', 'renatoFerN@gmail.com','renato010203'),
	(default, 'Álvaro Santos Silva', '1987-05-23','09298723471','987300265', '1198403-4412', 'corpAlv@outlook.com','camilameuamor'),
	(default, 'João Baptista Figueiro Lima', '1985-09-15','67326589076','341123980', '1194664-1043', 'jjBaptista@gmail.com','JBFL100');

DESCRIBE usuario;
SELECT * FROM usuario;


-- Produtores listados:
SELECT nome as 'Nome dos Produtores' FROM usuario;


-- Produtores e os seus respectivos logins:
SELECT nome as 'Nome dos Produtores', 
email as 'Email do Usuário',
senha as 'Senha de Login' FROM usuario;


-- Funcionalidade 'Esqueci a senha':
SELECT nome as Produtor,
senha as 'Senha Atual' FROM usuario
	WHERE nome = 'Renato Fernandes do Nascimento';
    
UPDATE usuario SET senha = 'renato111190'
		WHERE senha = 'renato010203';

SELECT nome as Produtor,
senha as 'Senha Nova' FROM usuario
	WHERE nome = 'Renato Fernandes do Nascimento';
    
SELECT nome as 'Nome dos Produtores', 
rg as 'RG',
concat('Dono', ' (CPF: ', cpf, ')') as 'Cargo' FROM usuario;
    


-- Tabela de Cadastro 2 (Cadastro da Empresa) --------------------------------------------

CREATE TABLE empresa (
	idEmpresa int primary key auto_increment,
    cnpj char(18) not null,
    nome varchar(40),
    nomeFic varchar(40),
	cep char(9),
    rua varchar(40),
    numero int,
    estado varchar(25),
    cidade varchar(25)
);


-- Inserção de valores, Botão CONCLUIR:
INSERT INTO empresa VALUES 
	(default, '69.805.127/0001-84', 'TropicChik, LTDA', 'TropiChic', '68220-970', 'Rua dos Gurupatubas', '121', 'Pará', 'Monte Alegre'),
	(default, '91.762.647/0001-06', 'GalinheiroVivs Aviário Convencional', 'GalinheiroVivs', '05528-270', 'Antônio  Serrado', '1098', 'São Paulo', 'São Paulo'),
    (default, '72.332.390/0001-24', 'Aviário Baptista, LTDA', 'AvrBaptista', '25725-696', 'José Vieira da Silva', '64', 'Rio de Janeiro', 'Petrópolis');
    

DESCRIBE empresa;
SELECT * FROM empresa;
    
    
-- Opção de confirmar
SELECT concat('Você confirma os dados? (S/N)', '    CNPJ: ', cnpj, '    Nome Fictício: ', nomeFic, '      CEP: ', cep, '      Número: ', numero) as Confirmação FROM empresa;
    
    
-- Mudança de CNPJ
UPDATE empresa SET cnpj = '76.354.748/0001-54', nome = 'Aviário Figueiras, LTDA', nomeFic = 'Aviário Figueiras', numero = '90'
		WHERE idEmpresa = 3;
		
		
-- Mudança da qtnd de caracteres do campo nome:
ALTER TABLE empresa MODIFY COLUMN nome varchar(50);
	
    
-- Mudança no nome do campo da rua:
ALTER TABLE empresa RENAME COLUMN rua TO logradouro;



-- Tabela de Cadastro 3 (Cadastro dos Lotes) --------------------------------------------

CREATE TABLE lote (
	idLote int primary key auto_increment, -- Para uso do nosso banco de dados
    identificador varchar(40) not null,    -- Para uso do usuário referente ao seu modelo de negócio
	qntdGalinhas int,
    faixaEtaria char(6),
    constraint chk_faixaEtaria check(faixaEtaria in('1-7','8-21','22-28')), -- Restrição (Constraint) para os intervalos de idade das galinhas
    especie varchar(20)
);


-- Inserção de dados dos lotes. A inserção desses dados serão feitas de empresa para empresa, aqui é apenas uma demonstração de diferentes empresas:
INSERT INTO lote VALUES
	(default, '#22293FEX', '500', '1-7', 'caipira'),
    (default, 'ff.22.OH', '120', '8-21', 'canela preta'),
    (default, '011023', '200', '22-28', 'indio gigante');


-- Exemplo de seleção de faixa etária por espécie para a determinação da temperatura de cada lote.
SELECT faixaEtaria FROM lote
	WHERE especie LIKE '%ira';


-- Informações gerais sobre os lotes:
SELECT concat('Há ', qntdGalinhas, ' galinhas da espécie ', especie, ' com a faixa etária de ', faixaEtaria, ' anos no lote ', identificador, '.') as 'Dados dos lotes' FROM lote;

