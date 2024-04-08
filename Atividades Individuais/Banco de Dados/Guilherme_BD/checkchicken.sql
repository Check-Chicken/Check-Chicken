CREATE DATABASE checkchicken;
USE checkchicken;

CREATE TABLE endereco (
idEndereco int primary key auto_increment,
logradouro varchar(45),
bairro varchar(45),
cidade varchar(45),
estado varchar(45),
cep char(8),
complemento varchar(45)
);

CREATE TABLE sensor (
idSensor int primary key auto_increment,
temperatura decimal(4,2),
umidade int,
registro datetime
);

CREATE TABLE lote (
idLote int primary key auto_increment,
nome varchar(45),
qtdGalinha int,
faixaEtaria varchar(15), constraint check (faixaEtaria in ('1-7', '8-14', '15-21','22-28','28 ao ABATE')),
fkSensor int,
constraint fkSensorLote foreign key (fkSensor) references sensor (idSensor)
);

CREATE TABLE empresa (
idEmpresa int primary key auto_increment,
nome varchar(45),
email varchar(45),
telefone varchar(11),
cnpj char(18),

fkEndereco int,
constraint fkEnderecoEmpresa foreign key (fkEndereco) references endereco (idEndereco),

fkLote int,
constraint fkLoteEmpresa foreign key (fkLote) references lote (idLote)
);

CREATE TABLE usuario (
idUsuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha varchar(45),
telefone varchar(11),
cpf char(11),

fkEmpresa int,
constraint fkEmpresaUsuario foreign key (fkEmpresa) references empresa (idEmpresa)
);