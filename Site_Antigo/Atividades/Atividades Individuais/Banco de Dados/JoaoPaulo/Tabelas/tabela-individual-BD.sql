create database sprint2;

use sprint2;

create table usuario (
idUsuario int primary key auto_increment,
nome varchar(100) not null,
dtNasc date,
cpf char(11) not null,
telefone char(12),
email varchar(264) not null unique,
senha varchar(100) not null,
fkEmpresa int,
CONSTRAINT fkUsuarioEmpresa FOREIGN KEY (fkEmpresa) references empresa (idEmpresa)
)auto_increment = 1;

insert into usuario (nome, dtNasc, cpf, telefone, email, senha) values
('João Silva', '1990-05-15', '12345678901', '11 987361236', 'joao.silva@email.com', 'senha123'),
('Maria Oliveira', '1985-08-20', '98765432109', '11 987159236', 'maria.oliveira@email.com', 'senha456'),
('Pedro Santos', '1978-03-10', '45678901234', '11 949061236', 'pedro.santos@email.com', 'senha789'),
('Ana Souza', '1995-12-25', '32109876543', '11 949070436', 'ana.souza@email.com', 'senhaabc'),
('Carlos Lima', '1982-06-30', '21098765432', '11 949060053', 'carlos.lima@email.com', 'senhadef');

create table empresa (
idEmpresa int primary key auto_increment,
nome varchar(50) not null,
representante varchar(50),
cnpj char(18) not null unique,
emailRepresentante varchar(50) not null unique,
telefone char(11)
);

insert into empresa (nome, representante, cnpj, emailRepresentante, telefone) values
('Ovos de Ouro Ltda', 'José Pereira', '12.345.678/0001-89', 'jose.pereira@empresa.com', '68 31101392'),
('Granja Feliz & Cia', 'Marcos Santos', '13.345.678/0001-90', 'marcos.santos@empresa.com', '96 29989554'),
('Avícola Pássaro Livre S.A', 'Fernanda Oliveira', '14.345.678/0001-91', 'fernanda.oliveira@empresa.com', '92 24366332'),
('Galinheiro Real Alimentos Ltda', 'Amanda Silva', '15.345.678/0001-92', 'amanda.silva@empresa.com', '83 24958782'),
('Pluma Dourada Indústria Avícola Ltda', 'Lucas Souza', '16.345.678/0001-93', 'lucas.souza@empresa.com', '67 25587564');

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








