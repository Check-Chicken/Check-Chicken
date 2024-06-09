create database checkchicken;

use checkchicken;

-- CRIAÇÃO DAS TABELAS 

-- TABELA DE USUARIO
create table usuario (
idUsuario int primary key auto_increment,
nome varchar(50),
dtNasc date,
cpf char(11),
telefone char(12),
email varchar(50) not null,
senha varchar(30) not null
);

insert into usuario (nome, dtNasc, cpf, telefone, email, senha) values
('João Silva', '1990-05-15', '12345678901', '11 987361236', 'joao.silva@email.com', 'senha123'),
('Maria Oliveira', '1985-08-20', '98765432109', '11 987159236', 'maria.oliveira@email.com', 'senha456'),
('Pedro Santos', '1978-03-10', '45678901234', '11 949061236', 'pedro.santos@email.com', 'senha789'),
('Ana Souza', '1995-12-25', '32109876543', '11 949070436', 'ana.souza@email.com', 'senhaabc'),
('Carlos Lima', '1982-06-30', '21098765432', '11 949060053', 'carlos.lima@email.com', 'senhadef');


-- TABELA DE EMPRESA
create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(50),
representante varchar(50),
cnpj char(18) not null,
emailRepresentante varchar(50),
telefone char(11)
);



insert into empresa (nome, representante, cnpj, emailRepresentante, telefone) values
('Ovos de Ouro Ltda', 'José Pereira', '12.345.678/0001-89', 'jose.pereira@empresa.com', '68 31101392'),
('Granja Feliz & Cia', 'Marcos Santos', '13.345.678/0001-90', 'marcos.santos@empresa.com', '96 29989554'),
('Avícola Pássaro Livre S.A', 'Fernanda Oliveira', '14.345.678/0001-91', 'fernanda.oliveira@empresa.com', '92 24366332'),
('Galinheiro Real Alimentos Ltda', 'Amanda Silva', '15.345.678/0001-92', 'amanda.silva@empresa.com', '83 24958782'),
('Pluma Dourada Indústria Avícola Ltda', 'Lucas Souza', '16.345.678/0001-93', 'lucas.souza@empresa.com', '67 25587564');



-- TABELA DE ENDEREÇO
create table endereço (
idEndereco int primary key auto_increment,
estado varchar(30),
cidade varchar(30),
cep char(9),
logradouro varchar(40),
numero int,
complemento varchar(50) default('Sem complemento')
);

insert into endereço (estado, cidade, cep, logradouro, numero, complemento) values
('São Paulo', 'São Paulo', '01000-000', 'Rua A', 123, 'Bloco A, Apto 101'),
('Rio de Janeiro', 'Rio de Janeiro', '20000-000', 'Avenida B', 456, 'Casa 2'),
('Minas Gerais', 'Belo Horizonte', '30000-000', 'Travessa C', 789, 'Sala 3'),
('Bahia', 'Salvador', '40000-000', 'Praça D', 101112, 'Galpão 1'),
('Santa Catarina', 'Florianópolis', '50000-000', 'Alameda E', 131415, default);

-- TABELA DE LOTE
create table lote (
idLote int primary key auto_increment,
identificador varchar(50) not null,
qtdGalinha int,
faixaEtaria varchar(15), constraint chkFaixa check (faixaEtaria in ('1-7', '8-14', '15-21','22-28','28 ao ABATE'))
);

insert into lote (identificador, qtdGalinha, faixaEtaria) values
('Lote 001', 1000, '1-7'),
('Lote 002', 800, '8-14'),
('Lote 003', 600, '15-21'),
('Lote 004', 400, '22-28'),
('Lote 005', 200, '28 ao ABATE');


-- TABELA DE SENSOR
create table sensor (
idSensor int primary key auto_increment,
temperatura decimal(4,2),
umidade int,
captura datetime
);

insert into sensor (temperatura, umidade, captura) values
(25.5, 60, '2024-03-20 10:46:27'),
(26.3, 55, '2024-03-20 12:14:52'),
(24.8, 58, '2024-03-21 11:32:34'),
(27.1, 62, '2024-03-21 09:21:45'),
(25.9, 57, '2024-03-22 16:43:22');

select * from usuario;
select * from empresa;
select * from endereço;
select * from lote;
select * from sensor;

-- FUNCIONALIDADES E PRÁTICAS:    -----------------------------------------------------------------------

-- Produtores listados:
SELECT nome as 'Nome dos Produtores' FROM usuario;


-- Produtores e os seus respectivos logins:
SELECT nome as 'Nome dos Produtores', 
email as 'Email do Usuário',
senha as 'Senha de Login' FROM usuario;


-- Funcionalidade 'Esqueci a senha':
SELECT nome as Produtor,
senha as 'Senha Atual' FROM usuario
	WHERE nome = 'João Silva';
    
UPDATE usuario SET senha = 'senha321'
		WHERE idUsuario = 1;

SELECT nome as Produtor,
senha as 'Senha Nova' FROM usuario
	WHERE nome = 'João Silva';


-- Verificar Cargo
SELECT nome as 'Nome dos Produtores', 
cpf as 'CPF',
concat('Dono ', idUsuario) as 'Cargo' FROM usuario;


-- Opção de confirmar dados na Tabela 2
SELECT concat('Você confirma os dados? (S/N)', '    CNPJ: ', cnpj, '    Razão Social: ', nome) as Confirmação FROM empresa;


-- Mudança de CNPJ
UPDATE empresa SET cnpj = '76.354.748/0001-54', nome = 'Aviário Figueiras, LTDA'
		WHERE idEmpresa = 3;
        
SELECT * FROM empresa
	WHERE idEmpresa = 3;
    
    
-- Mudança da qtnd de caracteres do campo nome:
ALTER TABLE empresa MODIFY COLUMN nome varchar(65);


-- Mudança no nome do campo da rua:
ALTER TABLE empresa RENAME COLUMN rua TO logradouro;


-- Exemplo de seleção de faixa etária por identificadores terminados com 1.
SELECT faixaEtaria as 'Faixa Etária das Galinhas' FROM lote
	WHERE identificador LIKE '%1';


-- Informações gerais sobre os lotes:
SELECT concat('Há ', qtdGalinha, ' galinhas com a faixa etária de ', faixaEtaria, ' anos no lote ', identificador, '.') as 'Dados dos lotes' FROM lote;
