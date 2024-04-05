create database BDsprint;

use BDsprint;

create table usuario(
idusuario int primary key auto_increment,
nome varchar(30),
usuário varchar (30),
senha varchar(30)); 

insert into usuario (nome, usuário, senha) values
('João Silva', 'joao.silva', 'senha123'),
('Maria Santos', 'maria.santos', 'senha456'),
('Carlos Oliveira', 'carlos.oliveira', 'senha789');

create table empresa(
id_usuario int primary key,
nome varchar (50),
cnpj char(14),
telefone char(12),
emailRepresentante varchar(45));

insert into empresa (id_usuario, nome, cnpj, telefone, emailRepresentante) values
(1, 'MariGarden', '12345678901234', '1234567890', 'joao@MariGarden.com'),
(2, 'TechRyzen', '98765432109876', '0987654321', 'maria@TechRyzen.com'),
(3, 'ChickenFarm', '56789012345678', '5678901234', 'carlos@ChickenFarm.com');


create table endereço(
id_endereco int primary key,
estado char(2),
cidade varchar (40),
cep char(8),
bairro varchar (40),
logradouro varchar(100),
numero varchar(15),
complemento varchar(30));

insert into endereço values
(1, 'SP', 'São Paulo', '01234567', 'Centro', 'Rua Principal', '123', 'Sala 101'),
(2, 'RJ', 'Rio de Janeiro', '98765432', 'Copacabana', 'Avenida Beira Mar', '456', 'Apartamento 202'),
(3, 'MG', 'Belo Horizonte', '56789012', 'Barro Preto', 'Rua das Flores', '789', 'Casa 303');


 




