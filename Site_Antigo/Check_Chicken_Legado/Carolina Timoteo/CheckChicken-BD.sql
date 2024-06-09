
create database CheckChicken;

use CheckChicken;

/*login:
e-mail, senha, nome completo, data de nascimento, tel para contato,*/

create table Login(
idLog int primary key auto_increment,
senha char (8),
nome_completo varchar (80),
dtNascimento date,
TelContato varchar (20)
);

insert into Login values
(default, 'senha001', 'Nome completo1','1980-10-01','(00)000-0001'),
(default, 'senha002', 'Nome Completo2','1980-10-02','(00)000-0002'),
(default, 'senha003', 'Nome Completo3','1980-10-03','(00)000-0003');

/*cadastro empresa:
CNPJ, nome da empresa, nome do estbelecimento, cep, logadouro, numero:, estado, cidade*/

create table Empresa(
idEmpresa int primary key auto_increment,
CNPJ char (14),
nomeEmpresa varchar (40),
nomeFantasia varchar (40),
CEP char (8),
logadouro varchar (80),
numero varchar (10),
estado varchar (30),
cidade varchar (30)
);

alter table Empresa
modify CEP varchar (18);

insert into Empresa value
(default, '00000000000001', 'Nome Empresa 1', 'Nome Fantasia 1', '0000-0000','logadouro1','001','São Paulo', 'São Paulo'),
(default, '00000000000002', 'Nome Empresa 2', 'Nome Fantasia 2', '0000-0002','logadouro2','002','São Paulo', 'São Paulo'),
(default, '00000000000003', 'Nome Empresa 3', 'Nome Fantasia 3', '0000-0003','logadouro3','003','São Paulo', 'São Paulo');


/*Cadastro lote:
identificador do lote, quantidade de galinhas do lote, faixa etéria do lote, tipo de ave de corte produzida*/

create table Lote(
idLote int primary key auto_increment,
identificador_lote varchar (50),
quantidade_galinhas int,
faixa_etaria char (5),
constraint chk_faixa_etaria check (faixa_etaria in('1-7', '8-21', '22-28')),
Tipo_ave varchar (40)
);

insert into Lote value
(default, 'galinha01', 50, '1-7','frango'),
(default, 'galinha02', 50, '8-21','frango'),
(default, 'galinha03', 50, '22-28','frango');


select * from Empresa;
