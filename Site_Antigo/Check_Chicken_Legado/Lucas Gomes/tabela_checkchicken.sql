CREATE DATABASE checkchicken;

USE checkchicken;

-- TABELA PARA ARMAZENAR OS DADOS DE CADASTRO DO USUÁRIO

CREATE TABLE cadastroUsuario (
	idUsuario int primary key auto_increment,
    nomeCompleto varchar(60),
    dtNasc date,
    cpf char(11),
    email varchar(40),
    telefone char(12),
    senha varchar(25)
    );
    
-- TABELA PARA ARMAZENAR OS DADOS DE CADASTRO DA EMPRESA DO USUÁRIO  
  
CREATE TABLE cadastroEmpresa (
	idEmpresa int primary key auto_increment,
    nomeEmpresa varchar(40),
    nomeRepres varchar(50),
    cnpj char(18),
    email varchar(40),
    telefone char(12)
    );

-- TABELA PARA ARMAZENAR O ENDEREÇO DA EMPRESA ( SERÁ FORNECIDO POR API )

CREATE TABLE endereço (
	idEndereço int primary key auto_increment,
    cep char(9),
    estado varchar(25),
    cidade varchar(30),
    bairro varchar(40),
    logradouro varchar(40),
    numero int
    );
  
 -- TABELA PARA ARMAZENAR OS DADOS COLETADOS PELOS SENSORES DE TEMPERATURA E UMIDADE  
  
CREATE TABLE sensores (
	idSensor int primary key auto_increment,
	temperatura decimal(4,2),
    umidade int
    );
    
-- TABELA PARA ARMAZENAR OS DADOS REFERENTES AOS LOTES DA EMPRESA

CREATE TABLE lotes (
	idLote int primary key auto_increment,
    qtdGalinha int,
    idadeGalinha int,
	constraint chkIdadeGalinha check ( idadeGalinha in (1-7, 8-14, 15-21))
    );
	
    
    