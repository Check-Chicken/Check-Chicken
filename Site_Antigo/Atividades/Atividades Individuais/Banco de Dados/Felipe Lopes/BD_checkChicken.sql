create database checkChicken;

use checkChicken;

-- Tabela de login do usuário
create table login(
idlogin int primary key auto_increment,
nomeUsuario varchar(45),
email varchar(70),
senha varchar(45)
);

-- Tabela da Empresa cadastrada no site
create table empresa(
idEmpresa int primary key auto_increment,
nome varchar(45),
cnpj char(14),
cep char(8),
logradura varchar(45),
estado varchar(45),
cidade varchar(45),
fkLogin int,
constraint fkLoginEmpresa foreign key (fkLogin) references login (idLogin)
);

-- cadastro do Produtor
create table produtor(
idProdutor int primary key auto_increment,
nome varchar(45),
dataNascimento date,
telefone varchar(12),
cpf char(11),
rg char(10),
fkLogin int,
constraint fkLoginProdutor foreign key (fkLogin) references login (idLogin),

fkEmpresa int,
constraint fkEmpresaProdutor foreign key (fkEmpresa) references empresa(idEmpresa)
);


-- Lote de Aves
create table lote(
idLote int ,
qtdGalinha int,
faixaEtaria int,
tipoAve varchar(45),
fkEmpresa int,
constraint fkEmpresalote foreign key (fkEmpresa) references empresa(idEmpresa)
);


-- Dados do arduino
create table dados(
idDados int primary key auto_increment,
temperatura int,
umidade int,
fkLote int
);

alter table dados
add constraint fkDadosLote foreign key (fkLote) references lote(idLote) 